import subprocess
from File import File

def cmdLineOutput(cmd):
    data = subprocess.check_output(cmd, shell=True, stderr=(subprocess.STDOUT))
    data = data.decode('utf-8')
    return data.replace('\r\n', '\n')


def makeBinUtilCommandFile(command: str) -> File:
    BIN_UTILS_COMMAND_FILE_PATH = 'IntermediateFiles/binUtilCommands.txt'
    commandFile = File(BIN_UTILS_COMMAND_FILE_PATH)
    commandFile.write(command)
    assert commandFile.exists()
    return commandFile