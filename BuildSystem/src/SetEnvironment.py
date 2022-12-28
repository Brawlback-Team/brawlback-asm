import os, re, glob, shutil

def setEnvironment(buildDirectory, ppcBinDirectory=None):
    os.chdir(buildDirectory)
    removeDevkitFromPath()
    if ppcBinDirectory is None:
        ppcBinDirectory = 'Compiler/bin'
    setDevkitPath(ppcBinDirectory)
    resetDir('Disassembly')
    resetDir('IntermediateFiles')
    resetDir('Output')
    resetDir('IntermediateFiles/Renamed')
    resetDir('IntermediateFiles/Removed')


def removeDevkitFromPath():
    os.environ['PATH'] = re.sub('(;|^)[^;]*?devkitPro.*?(;|$)', ';', os.environ['PATH'])
    os.environ['PATH'] = re.sub('(;|^)[^;]*?mingw.*?(;|$)', ';', os.environ['PATH'])


def setDevkitPath(ppcBinDirectory):
    os.environ['PATH'] += f";{ppcBinDirectory}"


def resetDir(directory):
    if os.path.exists(directory):
        clearDir(directory)
    else:
        os.mkdir(directory)


def clearDir(directory):
    files = glob.glob(f"{directory}/*")
    for f in files:
        shutil.rmtree(f)