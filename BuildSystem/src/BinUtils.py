# Instruction context:
#
#  L.  35        66  LOAD_GLOBAL              os
#                   68  LOAD_METHOD              system
#                   70  LOAD_FAST                'command'
#                   72  CALL_METHOD_1         1  ''
# ->                74  POP_TOP
#                   76  POP_EXCEPT
#                   78  JUMP_FORWARD         82  'to 82'
#                   80  END_FINALLY
#                 82_0  COME_FROM            78  '78'

from Common import cmdLineOutput, makeBinUtilCommandFile
from File import File
import os

def objdump(source: 'Library', options: str, cmdOutput: File=None):
    OBJDUMP_PATH = 'powerpc-eabi-objdump'
    output = binutil(OBJDUMP_PATH, f"{options} {source.path}", cmdOutput)
    return output


def objcopy(source: 'Library', dest: File, options: str, cmdOutput: File=None):
    OBJCOPY_PATH = 'powerpc-eabi-objcopy'
    output = binutil(OBJCOPY_PATH, f"{options} {source.path} {dest.path}", cmdOutput)
    assert dest.exists()
    return output


def nm(source: 'Library', options: str, cmdOutput: File=None):
    NM_PATH = 'powerpc-eabi-nm'
    output = binutil(NM_PATH, f"{options} {source.path}", cmdOutput)
    return output

def binutil(path = None, options = None, cmdOutput = None):
#Warning: block stack is not empty!
    # commandFile = makeBinUtilCommandFile(options)
    # command = f'''{path} @{commandFile.path}'''
    # if cmdOutput is not None:
    #     command += f''' > {cmdOutput.path}'''
    #
    # try:
    #     pass
    # finally:
    #     return None
    #     os.system(command)
    # raise Exception(f'''{command}''')
    # return None

    commandFile = makeBinUtilCommandFile(options)
    command = f'''{path} @{commandFile.path}'''
    if cmdOutput is not None:
        command += f''' > {cmdOutput.path}'''
    #try:
    return cmdLineOutput(command)
    #finally:
    os.system(command)

    raise Exception(f'''{command}''')

# def binutil--- This code section failed: ---
#
#  L.  27         0  LOAD_GLOBAL              makeBinUtilCommandFile
#                 2  LOAD_FAST                'options'
#                 4  CALL_FUNCTION_1       1  ''
#                 6  STORE_FAST               'commandFile'
#
#  L.  28         8  LOAD_FAST                'path'
#                10  FORMAT_VALUE          0  ''
#                12  LOAD_STR                 ' @'
#                14  LOAD_FAST                'commandFile'
#                16  LOAD_ATTR                path
#                18  FORMAT_VALUE          0  ''
#                20  BUILD_STRING_3        3
#                22  STORE_FAST               'command'
#
#  L.  29        24  LOAD_FAST                'cmdOutput'
#                26  LOAD_CONST               None
#                28  COMPARE_OP               is-not
#                30  POP_JUMP_IF_FALSE    48  'to 48'
#
#  L.  30        32  LOAD_FAST                'command'
#                34  LOAD_STR                 ' > '
#                36  LOAD_FAST                'cmdOutput'
#                38  LOAD_ATTR                path
#                40  FORMAT_VALUE          0  ''
#                42  BUILD_STRING_2        2
#                44  INPLACE_ADD
#                46  STORE_FAST               'command'
#              48_0  COME_FROM            30  '30'
#
#  L.  31        48  SETUP_FINALLY        60  'to 60'
#
#  L.  32        50  LOAD_GLOBAL              cmdLineOutput
#                52  LOAD_FAST                'command'
#                54  CALL_FUNCTION_1       1  ''
#                56  POP_BLOCK
#                58  RETURN_VALUE
#              60_0  COME_FROM_FINALLY    48  '48'
#
#  L.  33        60  POP_TOP
#                62  POP_TOP
#                64  POP_TOP
#
#  L.  35        66  LOAD_GLOBAL              os
#                68  LOAD_METHOD              system
#                70  LOAD_FAST                'command'
#                72  CALL_METHOD_1         1  ''
#                74  POP_TOP
#                76  POP_EXCEPT
#                78  JUMP_FORWARD         82  'to 82'
#                80  END_FINALLY
#              82_0  COME_FROM            78  '78'
#
#  L.  36        82  LOAD_GLOBAL              Exception
#                84  LOAD_FAST                'command'
#                86  FORMAT_VALUE          0  ''
#                88  CALL_FUNCTION_1       1  ''
#                90  RAISE_VARARGS_1       1  'exception instance'

# Parse error at or near `POP_TOP' instruction at offset 74

# file BinUtils.pyc
# Deparsing stopped due to parse error