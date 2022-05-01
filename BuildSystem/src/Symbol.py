from dataclasses import dataclass
import re

@dataclass
class Symbol:
    name: str
    address: int
    size: int
    type: str

    def __post_init__(self):
        assert len(self.type) == 1

    def isInjection(self):
        return '_INJECTION_' in self.name

    def isStartup(self):
        return '_STARTUP_' in self.name

    def isSpecial(self):
        return self.isInjection() or self.isStartup()

    def injectionAddress(self):
        assert self.isInjection()
        address = re.search('_INJECTION_(0x[0-9a-fA-F]{8})', self.name)[1]
        return int(address, 16)

    def __hash__(self):
        return hash(self.name)