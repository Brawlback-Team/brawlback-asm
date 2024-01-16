import re
from typing import List
from Section import Section
from Symbol import Symbol
from File import File
from BinUtils import objcopy, objdump, nm

class Library(File):

    def __init__(self, path):
        super().__init__(path)
        assert self.exists()
        self._sections = None
        self._symbols = None

    @property
    def sections(self):
        if self._sections is None:
            self._sections = set()
            self._initSections()
        return self._sections

    def _initSections(self):
        text = objdump(self, '-h')
        sectionRegex = '[0-9] ([_0-9a-zA-Z]+__(text|rodata|sbss|bss|data|sdata)__) +([0-9a-f]{8}) +([0-9a-f]{8})'
        sections = re.findall(sectionRegex, text)
        for s in sections:
            self._sections.add(Section(s[0], int((s[3]), base=16), int((s[2]), base=16), s[1]))

    @property
    def symbols(self):
        if self._symbols is None:
            self._symbols = set()
            self._initSymbols()
        return self._symbols

    def _initSymbols(self):
        text = nm(self, '-C -S -l -v')
        symbolRegex = '([0-9a-z]{8}) +([0-9a-z]{8}) (.) (.*)'
        symbols = re.findall(symbolRegex, text)
        for s in symbols:
            name = re.sub('\\t.*[\\\\/]', '/', s[3]).strip()
            self._symbols.add(Symbol(name, int((s[0]), base=16), int((s[1]), base=16), s[2]))

    def extractSections(self, sections, dest: File):
        assert len(sections) > 0, 'Must extract at least one section, or it will copy the entire file'
        sections = ' '.join((f"--only-section={s.name}" for s in sections))
        return self.objcopy(sections, dest)

    def objcopy(self, options: str, dest: File):
        output = objcopy(self, dest, options)
        output = filterEmptySegmentWarning(output)
        if output:
            print(output)
        return self.__class__(dest.path)

    def compress(self, dest: File):
        dest = self.objcopy('--set-section-flags *=load,alloc', dest)
        result = dest.objcopy('-O binary -S', dest)
        assert result.size() == self.expectedCompressedSize(), f"Compressed file {dest.name} was {result.size()} bytes, expected {self.expectedCompressedSize()}"
        return result

    def expectedCompressedSize(self):
        startAddress = min((s.address for s in self.sections))
        endSection = max((s for s in self.sections), key=(lambda s: s.address))
        expectedSize = endSection.address - startAddress + endSection.size
        return expectedSize

    def constructors(self) -> List[Section]:
        return [s for s in self.sections if '_GLOBAL__sub_I_' in s.name]

    def getSectionByName(self, name: str):
        s = [s for s in self.sections if s.name == name]
        assert len(s) == 1
        return s[0]


class InitialSectionNameLibrary(Library):

    def _initSections(self):
        text = objdump(self, '-h')
        sectionRegex = '[0-9] +(\\.(text|rodata|sbss|bss|data|sdata)\\.[a-zA-Z0-9_]+) +([0-9a-f]{8})'
        sections = re.findall(sectionRegex, text)
        for s in sections:
            self._sections.add(Section(s[0], -1, int((s[2]), base=16), s[1]))


class FinalSectionNameLibrary(Library):

    def _initSections(self):
        text = objdump(self, '-h')
        sectionRegex = '^ *[0-9]+ +((.*?__(text|rodata|sbss|bss|data|sdata)__.*?)|(\.(text|rodata|sbss|bss|data|sdata))) +([0-9a-fA-F]{8}) +([0-9a-fA-F]{8})'
        sections = re.findall(sectionRegex, text, flags=(re.MULTILINE))
        for s in sections:
            if s[1] == '':
                if s[4] != '00000000':
                    self._sections.add(Section(s[0], int((s[6]), base=16), int((s[5]), base=16), s[4]))
                initArrayRegex = '^ *[0-9]+ +(\\.init_array) +([0-9a-fA-F]{8}) +([0-9a-fA-F]{8})'
                initArraySection = re.search(initArrayRegex, text, flags=(re.MULTILINE))
                if initArraySection:
                    self._sections.add(Section('.init_array', int((initArraySection[3]), base=16), int((initArraySection[2]), base=16), 'rodata'))
            else:
                if s[2] != '00000000':
                    self._sections.add(Section(s[0], int((s[6]), base=16), int((s[5]), base=16), s[2]))
                initArrayRegex = '^ *[0-9]+ +(\\.init_array) +([0-9a-fA-F]{8}) +([0-9a-fA-F]{8})'
                initArraySection = re.search(initArrayRegex, text, flags=(re.MULTILINE))
                if initArraySection:
                    self._sections.add(Section('.init_array', int((initArraySection[3]), base=16), int((initArraySection[2]), base=16), 'rodata'))


def filterEmptySegmentWarning(output: str):
    output = re.sub('.*warning: empty loadable segment.*', '', output)
    output = output.strip()
    return output