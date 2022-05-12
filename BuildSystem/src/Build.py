
#  L. 158       242  LOAD_CLOSURE             'segmentManager'
#                  244  BUILD_TUPLE_1         1
# ->               246  LOAD_SETCOMP             '<code_object <setcomp>>'
#                  248  LOAD_STR                 'getDebugInfo.<locals>.<setcomp>'
#                  250  MAKE_FUNCTION_8          'closure'
#                  252  LOAD_FAST                'symbols'
#                  254  GET_ITER
#                  256  CALL_FUNCTION_1       1  ''
#                  258  STORE_FAST               'initSymbols'

import sys, os, re
from SetEnvironment import setEnvironment
from LibraryDirectory import LibraryDirectory
from Library import Library, InitialSectionNameLibrary, File, FinalSectionNameLibrary
from Compiler import Compiler
from Settings import *
from SegmentManager import SegmentManager
from Symbol import Symbol
from itertools import chain
from BinUtils import objdump
from math import ceil
renamedCodesDir = 'IntermediateFiles\\Renamed'
removedConstructorsDir = 'IntermediateFiles\\Removed'
disassemblyDir = 'Disassembly'
symbolMapFile: File = None
settings: Settings = None

def build(buildDir=None, codesDir=None, ppcBinDirectory=None, brawlFuncMapPath=None, settingsPath=None):
    global symbolMapFile
    global settings
    if brawlFuncMapPath is None:
        brawlFuncMapPath = 'BrawlFuncMap.map'
    symbolMapFile = File(os.path.abspath(brawlFuncMapPath))
    if settingsPath is None:
        settingsPath = 'settings.json'
    settings = get_settings(settingsPath)

    assert symbolMapFile.exists(), f"Cannot find function map at {symbolMapFile.path}"
    if buildDir is None:
        buildDir = f"{os.getcwd()}/Build"
    setEnvironment(buildDir, ppcBinDirectory)
    if codesDir is None:
        codesDir = 'Codes9'
    inputCodesDirectoryObject = LibraryDirectory(codesDir, libraryType=InitialSectionNameLibrary)
    renamedCodesDirectoryObject = renameSections(inputCodesDirectoryObject)
    removedConstructorsDirectoryObject = renamedCodesDirectoryObject.removeSections(['.ctors', '.dtors'], removedConstructorsDir)
    compiler = Compiler()
    cppFile = makeCodesCPPFile(removedConstructorsDirectoryObject.symbols)
    linkedCodes = compiler.compile(cppFile, (removedConstructorsDirectoryObject.libraries), textStart=int("0x80000000", 0))
    functions = [s for s in linkedCodes.sections if s.type == 'text']
    segments = SegmentManager(settings)
    segments.assignFunctionAddresses(functions)
    temp = [segment.sections for segment in segments.codeSegments]
    codeSections = list(chain.from_iterable(temp))
    initFile = makeInitCPPFile(removedConstructorsDirectoryObject.symbols)
    compiledCodes = compiler.compile(initFile, (renamedCodesDirectoryObject.libraries), textStart=settings.INITIALIZER_SEGMENT_ADDRESS,
      dataStart=settings.DATA_SEGMENT_ADDRESS,
      sections=codeSections)
    compiledCodes = FinalSectionNameLibrary(compiledCodes.path)
    for s in compiledCodes.sections:
        assert int("0x80000000", 0) <= s.address <= int("0xA0000000", 0), f"{s}, address: {hex(s.address)} out of acceptable range"
    segments.assignExtraAddresses(compiledCodes.sections)
    getDebugInfo(compiledCodes, segments)
    files = extractFiles(compiledCodes, segments)
    data = makeFilesFile(compiledCodes, files)
    f = File('Output/files')
    f.writeBinary(data)


def renameSections(codesDirectory: LibraryDirectory):
    name2NewName = {}
    for s in codesDirectory.sections:
        name2NewName[s.name] = s.name.replace(f".{s.type}.", '') + f"__{s.type}__"
    else:
        return codesDirectory.renameSections(name2NewName, renamedCodesDir)


def makeCodesCPPFile(symbols):
    cppFormat = '\n    asm(R"(.globl _start\n    _start:\n        {codeBranches}\n    )");\n    '
    injections = []
    for s in symbols:
        if s.isInjection():
            injections.append(s)
    branches = '\n\t\t'.join([f"b {i.name}" for i in injections])
    cppText = cppFormat.format(codeBranches=branches)
    cppFile = File('IntermediateFiles/cppFile.cpp')
    cppFile.write(cppText)
    return cppFile


def makeInitCPPFile(symbols):
    initFormat = '\n        asm(R"(.globl _start\n        _start:\n            b _INITIALIZE_\n            {codeBranches}\n            {writes}\n        )");\n        '
    injections = []
    for s in symbols:
        if s.isInjection() or s.isStartup():
            injections.append(s)
    branches = '\n\t\t'.join([f"b {i.name}" for i in injections])
    writes = []
    for s in symbols:
        if s.name.startswith('_STRING_WRITE_') or s.name.startswith('_DATA_WRITE_'):
            name = s.name.partition('/')[0]
            writes.append(name)
    writes = '\n\t\t'.join((f"b {w}" for w in writes))
    initText = initFormat.format(codeBranches=branches, writes=writes)
    initFile = File('IntermediateFiles/initFile.cpp')
    initFile.write(initText)
    return initFile

def getDebugInfo(library = None, segmentManager = None):
    symbolText = []
    #symbols = (lambda .0: pass# WARNING: Decompyle incomplete
#)(library.symbols)
    symbols = {symbol for symbol in library.symbols if not symbol.name.startswith('.')}
    for section in library.sections:
        if section.name.startswith('.'):
            if section.size > 0:
                symbols.add(Symbol(section.name, section.address, section.size, "_"))
    memoryHeapAddress = segmentManager.dataSegment.currentEnd()
    memoryHeapAddress += 32 - memoryHeapAddress % 32
    memoryHeapSize = segmentManager.dataSegment.endAddress - memoryHeapAddress
    symbols.add(Symbol('C++_HEAP', memoryHeapAddress, memoryHeapSize, '_'))
    symbols = sorted(symbols, key = (lambda s: s.address))
    for s in symbols:
        symbolText.append(f"{s.address:08x} {s.size:08x} {s.type} {s.name}")
    symbolText = '\n'.join(symbolText)
    addressesFile = File(f'''{disassemblyDir}/nm.txt''')
    addressesFile.write(symbolText)
    #initSymbols = (lambda .0 = None: pass# WARNING: Decompyle incomplete
#)(symbols)
    initSymbols = {s for s in symbols if not segmentManager.initializerSegment.canInsert(s) and segmentManager.dataSegment.canInsert(s)}
    makeMap(initSymbols, File(f'''{disassemblyDir}/Initializers.map'''))
    #otherSymbols = (lambda .0 = None: pass# WARNING: Decompyle incomplete
#)(symbols)
    otherSymbols = {s for s in symbols if not segmentManager.initializerSegment.canInsert(s)}
    makeMap(otherSymbols, File(f'''{disassemblyDir}/Symbols.map'''))
    disassemblyFile = File(f'''{disassemblyDir}/dis.txt''')
    objdump(library, '-h', disassemblyFile)

# def getDebugInfo--- This code section failed: ---
#
#  L. 141         0  BUILD_LIST_0          0
#                 2  STORE_FAST               'symbolText'
#
#  L. 142         4  LOAD_SETCOMP             '<code_object <setcomp>>'
#                 6  LOAD_STR                 'getDebugInfo.<locals>.<setcomp>'
#                 8  MAKE_FUNCTION_0          'Neither defaults, keyword-only args, annotations, nor closures'
#                10  LOAD_FAST                'library'
#                12  LOAD_ATTR                symbols
#                14  GET_ITER
#                16  CALL_FUNCTION_1       1  ''
#                18  STORE_FAST               'symbols'
#
#  L. 143        20  LOAD_FAST                'library'
#                22  LOAD_ATTR                sections
#                24  GET_ITER
#              26_0  COME_FROM            50  '50'
#              26_1  COME_FROM            40  '40'
#                26  FOR_ITER             80  'to 80'
#                28  STORE_FAST               'section'
#
#  L. 144        30  LOAD_FAST                'section'
#                32  LOAD_ATTR                name
#                34  LOAD_METHOD              startswith
#                36  LOAD_STR                 '.'
#                38  CALL_METHOD_1         1  ''
#                40  POP_JUMP_IF_FALSE    26  'to 26'
#                42  LOAD_FAST                'section'
#                44  LOAD_ATTR                size
#                46  LOAD_CONST               0
#                48  COMPARE_OP               >
#                50  POP_JUMP_IF_FALSE    26  'to 26'
#
#  L. 145        52  LOAD_FAST                'symbols'
#                54  LOAD_METHOD              add
#                56  LOAD_GLOBAL              Symbol
#                58  LOAD_FAST                'section'
#                60  LOAD_ATTR                name
#                62  LOAD_FAST                'section'
#                64  LOAD_ATTR                address
#                66  LOAD_FAST                'section'
#                68  LOAD_ATTR                size
#                70  LOAD_STR                 '_'
#                72  CALL_FUNCTION_4       4  ''
#                74  CALL_METHOD_1         1  ''
#                76  POP_TOP
#                78  JUMP_BACK            26  'to 26'
#
#  L. 146        80  LOAD_DEREF               'segmentManager'
#                82  LOAD_ATTR                dataSegment
#                84  LOAD_METHOD              currentEnd
#                86  CALL_METHOD_0         0  ''
#                88  STORE_FAST               'memoryHeapAddress'
#
#  L. 148        90  LOAD_FAST                'memoryHeapAddress'
#                92  LOAD_CONST               32
#                94  LOAD_FAST                'memoryHeapAddress'
#                96  LOAD_CONST               32
#                98  BINARY_MODULO
#               100  BINARY_SUBTRACT
#               102  INPLACE_ADD
#               104  STORE_FAST               'memoryHeapAddress'
#
#  L. 149       106  LOAD_DEREF               'segmentManager'
#               108  LOAD_ATTR                dataSegment
#               110  LOAD_ATTR                endAddress
#               112  LOAD_FAST                'memoryHeapAddress'
#               114  BINARY_SUBTRACT
#               116  STORE_FAST               'memoryHeapSize'
#
#  L. 150       118  LOAD_FAST                'symbols'
#               120  LOAD_METHOD              add
#               122  LOAD_GLOBAL              Symbol
#               124  LOAD_STR                 'C++_HEAP'
#               126  LOAD_FAST                'memoryHeapAddress'
#               128  LOAD_FAST                'memoryHeapSize'
#               130  LOAD_STR                 '_'
#               132  CALL_FUNCTION_4       4  ''
#               134  CALL_METHOD_1         1  ''
#               136  POP_TOP
#
#  L. 151       138  LOAD_GLOBAL              sorted
#               140  LOAD_FAST                'symbols'
#               142  LOAD_LAMBDA              '<code_object <lambda>>'
#               144  LOAD_STR                 'getDebugInfo.<locals>.<lambda>'
#               146  MAKE_FUNCTION_0          'Neither defaults, keyword-only args, annotations, nor closures'
#               148  LOAD_CONST               ('key',)
#               150  CALL_FUNCTION_KW_2     2  '2 total positional and keyword args'
#               152  STORE_FAST               'symbols'
#
#  L. 152       154  LOAD_FAST                'symbols'
#               156  GET_ITER
#               158  FOR_ITER            208  'to 208'
#               160  STORE_FAST               's'
#
#  L. 153       162  LOAD_FAST                'symbolText'
#               164  LOAD_METHOD              append
#               166  LOAD_FAST                's'
#               168  LOAD_ATTR                address
#               170  LOAD_STR                 '08X'
#               172  FORMAT_VALUE_ATTR     4  ''
#               174  LOAD_STR                 ' '
#               176  LOAD_FAST                's'
#               178  LOAD_ATTR                size
#               180  LOAD_STR                 '08X'
#               182  FORMAT_VALUE_ATTR     4  ''
#               184  LOAD_STR                 ' '
#               186  LOAD_FAST                's'
#               188  LOAD_ATTR                type
#               190  FORMAT_VALUE          0  ''
#               192  LOAD_STR                 ' '
#               194  LOAD_FAST                's'
#               196  LOAD_ATTR                name
#               198  FORMAT_VALUE          0  ''
#               200  BUILD_STRING_7        7
#               202  CALL_METHOD_1         1  ''
#               204  POP_TOP
#               206  JUMP_BACK           158  'to 158'
#
#  L. 154       208  LOAD_STR                 '\n'
#               210  LOAD_METHOD              join
#               212  LOAD_FAST                'symbolText'
#               214  CALL_METHOD_1         1  ''
#               216  STORE_FAST               'symbolText'
#
#  L. 155       218  LOAD_GLOBAL              File
#               220  LOAD_GLOBAL              disassemblyDir
#               222  FORMAT_VALUE          0  ''
#               224  LOAD_STR                 '/nm.txt'
#               226  BUILD_STRING_2        2
#               228  CALL_FUNCTION_1       1  ''
#               230  STORE_FAST               'addressesFile'
#
#  L. 156       232  LOAD_FAST                'addressesFile'
#               234  LOAD_METHOD              write
#               236  LOAD_FAST                'symbolText'
#               238  CALL_METHOD_1         1  ''
#               240  POP_TOP
#
#  L. 158       242  LOAD_CLOSURE             'segmentManager'
#               244  BUILD_TUPLE_1         1
#               246  LOAD_SETCOMP             '<code_object <setcomp>>'
#               248  LOAD_STR                 'getDebugInfo.<locals>.<setcomp>'
#               250  MAKE_FUNCTION_8          'closure'
#               252  LOAD_FAST                'symbols'
#               254  GET_ITER
#               256  CALL_FUNCTION_1       1  ''
#               258  STORE_FAST               'initSymbols'
#
#  L. 160       260  LOAD_GLOBAL              makeMap
#               262  LOAD_FAST                'initSymbols'
#               264  LOAD_GLOBAL              File
#               266  LOAD_GLOBAL              disassemblyDir
#               268  FORMAT_VALUE          0  ''
#               270  LOAD_STR                 '/Initializers.map'
#               272  BUILD_STRING_2        2
#               274  CALL_FUNCTION_1       1  ''
#               276  CALL_FUNCTION_2       2  ''
#               278  POP_TOP
#
#  L. 161       280  LOAD_CLOSURE             'segmentManager'
#               282  BUILD_TUPLE_1         1
#               284  LOAD_SETCOMP             '<code_object <setcomp>>'
#               286  LOAD_STR                 'getDebugInfo.<locals>.<setcomp>'
#               288  MAKE_FUNCTION_8          'closure'
#               290  LOAD_FAST                'symbols'
#               292  GET_ITER
#               294  CALL_FUNCTION_1       1  ''
#               296  STORE_FAST               'otherSymbols'
#
#  L. 163       298  LOAD_GLOBAL              makeMap
#               300  LOAD_FAST                'otherSymbols'
#               302  LOAD_GLOBAL              File
#               304  LOAD_GLOBAL              disassemblyDir
#               306  FORMAT_VALUE          0  ''
#               308  LOAD_STR                 '/Symbols.map'
#               310  BUILD_STRING_2        2
#               312  CALL_FUNCTION_1       1  ''
#               314  CALL_FUNCTION_2       2  ''
#               316  POP_TOP
#
#  L. 165       318  LOAD_GLOBAL              File
#               320  LOAD_GLOBAL              disassemblyDir
#               322  FORMAT_VALUE          0  ''
#               324  LOAD_STR                 '/dis.txt'
#               326  BUILD_STRING_2        2
#               328  CALL_FUNCTION_1       1  ''
#               330  STORE_FAST               'disassemblyFile'
#
#  L. 166       332  LOAD_GLOBAL              objdump
#               334  LOAD_FAST                'library'
#               336  LOAD_STR                 '-h'
#               338  LOAD_FAST                'disassemblyFile'
#               340  CALL_FUNCTION_3       3  ''
#               342  POP_TOP
#
# Parse error at or near `LOAD_SETCOMP' instruction at offset 246

def makeMap(symbols, dest: File):
    symbolText = symbolMapFile.read()
    symbolText = symbolText.strip()
    symbolText = symbolText.split('\n')
    for s in symbols:
        symbolText.append(f"{s.address:08x} {s.size:08x} {s.address:08x} 0 {s.name}")
    else:
        symbolText.append('94000000 00000004 94000000 0 FAKE')
        dest.write('\n'.join(symbolText) + '\n')


def makeFilesFile(compiledCodes: Library, files: list):
    data = bytearray()
    s = [s for s in compiledCodes.sections if s.name == '_INITIALIZE___text__']
    assert len(s) == 1, (f"{s}")
    data.extend(s[0].address.to_bytes(4, 'big'))
    data.extend(settings.INITIALIZER_INFO_ADDRESS.to_bytes(4, 'big'))
    data.extend(len(files).to_bytes(4, 'big'))
    for i, (f, a) in enumerate(files):
        data.extend(a.to_bytes(4, 'big'))
        sdFileName = f"codes/{f.name}"
        data.extend(sdFileName.encode('ascii'))
        data.extend((0).to_bytes(32 - len(sdFileName), 'big'))
    else:
        return data


def extractFiles(linkedCodes: Library, segmentList: SegmentManager):
    files = []
    for s in segmentList.segments.values():
        if s.sections:
            extractedCodes = linkedCodes.extractSections(s.sections, File(f"IntermediateFiles/{s.name}"))
            outputCodes = extractedCodes.compress(File(f"Output/{s.name}"))
            files.append((outputCodes, s.startAddress))
    initializersInfo = makeInitializerInfo(settings.INITIALIZER_INFO_ADDRESS, settings.INFO_SEGMENT_ADDRESS, linkedCodes, segmentList)
    f = File('Output/InitInfo')
    f.writeBinary(initializersInfo)
    files.append((f, settings.INITIALIZER_INFO_ADDRESS))
    injectionsInfo = makeInjectionsInfo(linkedCodes)
    f = File('Output/Injections')
    f.writeBinary(injectionsInfo)
    files.append((f, settings.INFO_SEGMENT_ADDRESS))
    return files


def makeInitializerInfo(initializerInfoAddress: int, injectionsInfoAddress: int, compiledCodes: Library, segmentManager: SegmentManager):
    memoryHeapInfoData = makeMemoryHeapInfo(segmentManager)
    startupsInfoData = makeStartupsInfo(compiledCodes)
    stringWriteInfoData = makeStringWriteInfo(compiledCodes)
    dataWriteInfoData = makeDataWriteInfo(compiledCodes)
    data = bytearray()
    memoryHeapInfoAddress = initializerInfoAddress + 20
    data += memoryHeapInfoAddress.to_bytes(4, 'big')
    startupsInfoAddress = memoryHeapInfoAddress + len(memoryHeapInfoData)
    data += startupsInfoAddress.to_bytes(4, 'big')
    stringWritesInfoAddress = startupsInfoAddress + len(startupsInfoData)
    data += stringWritesInfoAddress.to_bytes(4, 'big')
    dataWriteInfoAddress = stringWritesInfoAddress + len(stringWriteInfoData)
    data += dataWriteInfoAddress.to_bytes(4, 'big')
    data += injectionsInfoAddress.to_bytes(4, 'big')
    data.extend(memoryHeapInfoData)
    data.extend(startupsInfoData)
    data.extend(stringWriteInfoData)
    data.extend(dataWriteInfoData)
    return data


def makeMemoryHeapInfo(segmentManager: SegmentManager):
    data = bytearray()
    memoryHeapAddress = segmentManager.dataSegment.currentEnd()
    memoryHeapAddress += 32 - memoryHeapAddress % 32
    memoryHeapSize = segmentManager.dataSegment.endAddress - memoryHeapAddress
    data += memoryHeapAddress.to_bytes(4, 'big')
    data += memoryHeapSize.to_bytes(4, 'big')
    return data


def makeStartupsInfo(compiledCodes: Library):
    data = bytearray()
    constructors = compiledCodes.constructors()
    startups = [s for s in compiledCodes.symbols if s.isStartup()]
    data += (len(constructors) + len(startups)).to_bytes(4, 'big')
    for c in constructors:
        data += c.address.to_bytes(4, 'big')
    else:
        for s in startups:
            data += s.address.to_bytes(4, 'big')
        else:
            return data


def makeStringWriteInfo(compiledCodes):
    data = bytearray()
    writes = bytearray()
    for s in compiledCodes.symbols:
        w = re.search('_STRING_WRITE_(0x.+)', s.name)
        if w:
            targetAddress = int((w[1]), base=16).to_bytes(4, 'big')
            dataAddress = s.address.to_bytes(4, 'big')
            dataSize = s.size.to_bytes(4, 'big')
            writes += targetAddress
            writes += dataAddress
            writes += dataSize
    data += (len(writes) // 12).to_bytes(4, 'big')
    data += writes
    return data


def makeDataWriteInfo(compiledCodes: Library):
    writes = []
    for s in compiledCodes.symbols:
        w = re.search('_DATA_WRITE_([^_]+)_(0x[a-fA-F0-9]+)_((0x)?[a-fA-F0-9]+)', s.name)
        if w:
            address = int((w[1]), base=16).to_bytes(4, 'big')
            data = int((w[2]), base=16)
            data = data.to_bytes(ceil((len(w[2]) - 2) / 2), 'big')
            if w[4].startswith('0x'):
                repeats = int((w[3]), base=16)
            else:
                repeats = int(w[3])
            repeats = repeats.to_bytes(2, 'big')
            writes.append((address, data, repeats))
    data = bytearray()
    for w in writes:
        data += w[0]
        data += len(w[1]).to_bytes(2, 'big')
        data += w[2]
        alignedData = w[1] + bytearray(4 - len(w[1]) % 4)
        data += alignedData
    else:
        data += (0).to_bytes(4, 'big')
        return data


def makeInjectionsInfo(compiledCodes: Library):
    data = bytearray()
    injections = [s for s in compiledCodes.symbols if s.isInjection()]
    data += len(injections).to_bytes(4, 'big')
    for i in injections:
        data += i.injectionAddress().to_bytes(4, 'big')
        data += i.address.to_bytes(4, 'big')
        data += (i.address + i.size - 4).to_bytes(4, 'big')
    else:
        return data


if __name__ == '__main__':

    def show_exception_and_exit(exc_type, exc_value, tb):
        import traceback
        traceback.print_exception(exc_type, exc_value, tb)
        input('Press enter to exit.')
        sys.exit(-1)


    sys.excepthook = show_exception_and_exit
    build(*sys.argv[1:])
