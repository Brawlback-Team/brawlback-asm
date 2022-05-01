import os, ntpath, re
from Library import File, Library
from Section import Section
from Common import cmdLineOutput, makeBinUtilCommandFile
from typing import List
ppcCompiler = 'powerpc-eabi-g++.exe'
binUtilCommandFilePath = 'IntermediateFiles\\binUtilCommands.txt'

class Compiler:
    STANDARD_OPTIONS = [
     '-ggdb3', '-nostartfiles', '-fomit-frame-pointer', '-fno-function-cse', '-ffunction-sections', '-fdata-sections',
     '-fno-exceptions', '-fno-rtti', '-fno-asynchronous-unwind-tables', '-fno-unwind-tables', '-fno-stack-check', '-std=c++17',
     '-fno-builtin', '-ffreestanding', '-mcpu=750', '-mmultiple', '-fno-inline', '-save-temps=obj', '-fno-eliminate-unused-debug-symbols', '-fno-eliminate-unused-debug-types',
     '-fverbose-asm', '-fno-threadsafe-statics', '-z common-page-size=4', '-z max-page-size=4',
     '-Wl,"--relax"', '-Wl,"--gc-sections"']

    def __init__(self, options: list=None):
        if options is None:
            options = self.STANDARD_OPTIONS
        self.options = options

    def compile(self, cppFile: File, libraries, textStart: int=None, dataStart: int=None, sections: List[Section]=None, outPath: str=None, extraOptions: list=None):
        if not cppFile.exists():
            raise AssertionError(f"{cppFile.path} not found")
        else:
            options = self.options.copy()
            if textStart is not None:
                options.append(f'-Wl,"-Ttext={hex(textStart)}"')
            if dataStart is not None:
                options.append(f'-Wl,"--section-start=.rodata={hex(dataStart)}"')
            if sections is not None:
                for s in sections:
                    options.append(f'-Wl,"--section-start={s.name}={hex(s.address)}"')

        if extraOptions is not None:
            options.extend(extraOptions)
        commandFile = makeBinUtilCommandFile(' '.join(options))
        if outPath is None:
            outPath = ntpath.splitext(cppFile.path)[0]
        libraries = ' '.join([lib.path for lib in libraries])
        compileCommand = f"{ppcCompiler} {cppFile.path} @{commandFile.path} {libraries} {libraries} {libraries} -o {outPath}"
        try:
            output = cmdLineOutput(compileCommand)
            output = filterUselessWarnings(output)
            if output:
                print(output)
        except:
            os.system(compileCommand)
        else:
            return Library(outPath)


def filterUselessWarnings(output):
    output = re.sub('.*warning: cannot find entry symbol _start.*', '', output)
    output = re.sub('.*warning: dot moved backwards before.*', '', output)
    output = output.strip()
    return output