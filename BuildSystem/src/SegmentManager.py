# Instruction context:
#
#  L.  41        56  POP_TOP
# ->                58  CONTINUE             22  'to 22'
#                   60  JUMP_BACK            32  'to 32'
# Instruction context:
#
#  L.  58        88  POP_TOP
# ->                90  CONTINUE             54  'to 54'
#                   92  JUMP_BACK            64  'to 64'

from Segment import Segment2
from copy import deepcopy

class SegmentManager:

    def __init__(self, settings):
        self.segments = {}
        self.codeSegments = []
        for i, seg in enumerate(settings.CODE_SEGMENTS):
            seg = deepcopy(seg)
            seg.name = chr(ord('A') + i)
            self.segments[seg.name] = seg
            self.codeSegments.append(seg)
        else:
            self.extraSegments = []
            self.dataSegment = Segment2(settings.DATA_SEGMENT_ADDRESS, settings.MEMORY_HEAP_END_ADDRESS, name='Data')
            self.segments[self.dataSegment.name] = self.dataSegment
            self.extraSegments.append(self.dataSegment)
            self.initializerSegment = Segment2(settings.INITIALIZER_SEGMENT_ADDRESS, (settings.INITIALIZER_SEGMENT_ADDRESS + 65536), name='Init')
            self.segments[self.initializerSegment.name] = self.initializerSegment
            self.extraSegments.append(self.initializerSegment)
            self.checkForOverlaps()

    def checkForOverlaps(self):
        prevEndAddress = 0
        for seg in sorted((self.segments.values()), key=(lambda s: s.startAddress)):
            assert seg.startAddress >= prevEndAddress, f"{seg} overlap at {prevEndAddress} and {seg.startAddress}"
            prevEndAddress = seg.endAddress

    def assignFunctionAddresses(self, functions):
        sortedFunctions = sorted(functions, key=(lambda s: (s.size, s.name)), reverse=True)
        #raise Exception(f'''Failed to allocate {func}''')
        #continue

        for func in sortedFunctions:
            for s in self.codeSegments:
                if s.canInsert(func):
                    s.insert(func)
                    break
            else:
                raise Exception(f'''Failed to allocate {func}''')

        # for func in functions:
        #     for segment in self.codeSegments:
        #         if segment.canInsert(func):
        #             func.address = segment.currentAddress
        #             segment.insertFunction(func)
        #             break
        #     else:
        #         raise Exception(f"{func=} Couldn't fit")

    def assignExtraAddresses(self, allSections):
        extraSections = []
        #extraSections.append(section)
        #continue
        #raise Exception(f'''{section} has no home''')
        #continue

        for section in allSections:
            for segment in self.codeSegments:
                if section in segment.sections:
                    break
            else:
                extraSections.append(section)
        for section in extraSections:
            for segment in self.extraSegments:
                if segment.canInsert(section):
                    segment.insert(section)
                    break
            else:
                raise Exception(f'''{section} has no home''')

#     def assignFunctionAddresses--- This code section failed: ---
#
#  L.  36         0  LOAD_GLOBAL              sorted
#                 2  LOAD_FAST                'functions'
#                 4  LOAD_LAMBDA              '<code_object <lambda>>'
#                 6  LOAD_STR                 'SegmentManager.assignFunctionAddresses.<locals>.<lambda>'
#                 8  MAKE_FUNCTION_0          'Neither defaults, keyword-only args, annotations, nor closures'
#                10  LOAD_CONST               True
#                12  LOAD_CONST               ('key', 'reverse')
#                14  CALL_FUNCTION_KW_3     3  '3 total positional and keyword args'
#                16  STORE_FAST               'sortedFunctions'
#
#  L.  37        18  LOAD_FAST                'sortedFunctions'
#                20  GET_ITER
#                22  FOR_ITER             78  'to 78'
#                24  STORE_FAST               'func'
#
#  L.  38        26  LOAD_FAST                'self'
#                28  LOAD_ATTR                codeSegments
#                30  GET_ITER
#              32_0  COME_FROM            44  '44'
#                32  FOR_ITER             62  'to 62'
#                34  STORE_FAST               's'
#
#  L.  39        36  LOAD_FAST                's'
#                38  LOAD_METHOD              canInsert
#                40  LOAD_FAST                'func'
#                42  CALL_METHOD_1         1  ''
#                44  POP_JUMP_IF_FALSE    32  'to 32'
#
#  L.  40        46  LOAD_FAST                's'
#                48  LOAD_METHOD              insert
#                50  LOAD_FAST                'func'
#                52  CALL_METHOD_1         1  ''
#                54  POP_TOP
#
#  L.  41        56  POP_TOP
#                58  CONTINUE             22  'to 22'
#                60  JUMP_BACK            32  'to 32'
#
#  L.  43        62  LOAD_GLOBAL              Exception
#                64  LOAD_STR                 'Failed to allocate '
#                66  LOAD_FAST                'func'
#                68  FORMAT_VALUE          0  ''
#                70  BUILD_STRING_2        2
#                72  CALL_FUNCTION_1       1  ''
#                74  RAISE_VARARGS_1       1  'exception instance'
#                76  JUMP_BACK            22  'to 22'
#
# Parse error at or near `CONTINUE' instruction at offset 58
#
#     def assignExtraAddresses--- This code section failed: ---
#
#  L.  46         0  BUILD_LIST_0          0
#                 2  STORE_FAST               'extraSections'
#
#  L.  47         4  LOAD_FAST                'allSections'
#                 6  GET_ITER
#                 8  FOR_ITER             50  'to 50'
#                10  STORE_FAST               'section'
#
#  L.  48        12  LOAD_FAST                'self'
#                14  LOAD_ATTR                codeSegments
#                16  GET_ITER
#              18_0  COME_FROM            30  '30'
#                18  FOR_ITER             38  'to 38'
#                20  STORE_FAST               'segment'
#
#  L.  49        22  LOAD_FAST                'section'
#                24  LOAD_FAST                'segment'
#                26  LOAD_ATTR                sections
#                28  COMPARE_OP               in
#                30  POP_JUMP_IF_FALSE    18  'to 18'
#
#  L.  50        32  POP_TOP
#                34  CONTINUE              8  'to 8'
#                36  JUMP_BACK            18  'to 18'
#
#  L.  52        38  LOAD_FAST                'extraSections'
#                40  LOAD_METHOD              append
#                42  LOAD_FAST                'section'
#                44  CALL_METHOD_1         1  ''
#                46  POP_TOP
#                48  JUMP_BACK             8  'to 8'
#
#  L.  54        50  LOAD_FAST                'extraSections'
#                52  GET_ITER
#                54  FOR_ITER            110  'to 110'
#                56  STORE_FAST               'section'
#
#  L.  55        58  LOAD_FAST                'self'
#                60  LOAD_ATTR                extraSegments
#                62  GET_ITER
#              64_0  COME_FROM            76  '76'
#                64  FOR_ITER             94  'to 94'
#                66  STORE_FAST               'segment'
#
#  L.  56        68  LOAD_FAST                'segment'
#                70  LOAD_METHOD              canInsert
#                72  LOAD_FAST                'section'
#                74  CALL_METHOD_1         1  ''
#                76  POP_JUMP_IF_FALSE    64  'to 64'
#
#  L.  57        78  LOAD_FAST                'segment'
#                80  LOAD_METHOD              insert
#                82  LOAD_FAST                'section'
#                84  CALL_METHOD_1         1  ''
#                86  POP_TOP
#
#  L.  58        88  POP_TOP
#                90  CONTINUE             54  'to 54'
#                92  JUMP_BACK            64  'to 64'
#
#  L.  60        94  LOAD_GLOBAL              Exception
#                96  LOAD_FAST                'section'
#                98  FORMAT_VALUE          0  ''
#               100  LOAD_STR                 ' has no home'
#               102  BUILD_STRING_2        2
#               104  CALL_FUNCTION_1       1  ''
#               106  RAISE_VARARGS_1       1  'exception instance'
#               108  JUMP_BACK            54  'to 54'
#
# Parse error at or near `CONTINUE' instruction at offset 90

# file SegmentManager.pyc
# Deparsing stopped due to parse error