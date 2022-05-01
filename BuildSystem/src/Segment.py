from dataclasses import dataclass, field
from Section import Section

@dataclass
class Segment:
    startAddress: int
    endAddress: int
    name = None
    name: str
    sections = field(init=False)
    sections: set
    size = field(init=False)
    size: int
    remainingSize = field(init=False)
    remainingSize: int
    currentAddress = field(init=False)
    currentAddress: int

    def __post_init__(self):
        assert self.endAddress > self.startAddress
        assert self.startAddress >= int("0x80000000", 0)
        self.sections = set()
        self.size = self.endAddress - self.startAddress
        self.remainingSize = self.size
        self.currentAddress = self.startAddress

    def canInsert(self, section: Section):
        return section.size <= self.remainingSize

    def insert(self, section: Section):
        assert self.canInsert(section)
        assert section not in self.sections
        section.address = self.currentAddress
        self.sections.add(section)
        self.remainingSize -= section.size
        self.currentAddress += section.size
        assert self.size >= 0
        assert self.currentAddress <= self.endAddress


@dataclass
class Segment2:
    startAddress: int
    endAddress: int
    name = None
    name: str
    sections = field(init=False)
    sections: set
    size = field(init=False)
    size: int

    def __post_init__(self):
        assert self.endAddress > self.startAddress
        assert self.startAddress >= int("0x80000000", 0)
        self.sections = set()
        self.size = self.endAddress - self.startAddress

    def insert(self, section: Section):
        assert section not in self.sections
        assert section.address >= self.startAddress, f"{section} {hex(section.address)} {hex(self.startAddress)}"
        assert section.address + section.size <= self.endAddress
        self.sections.add(section)
        self.checkForOverlaps()

    def checkForOverlaps(self):
        prevEndAddress = 0
        for s in sorted((self.sections), key=(lambda s: s.address)):
            assert s.address >= prevEndAddress, f"{s} overlap at {hex(prevEndAddress)} and {hex(s.address)}"
            prevEndAddress = s.address + s.size

    def canInsert(self, section: Section):
        return section.address >= self.startAddress and section.address + section.size <= self.endAddress

    def currentEnd(self):
        return max((s.address + s.size for s in self.sections), default=(self.startAddress))