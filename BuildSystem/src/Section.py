from dataclasses import dataclass

@dataclass
class Section:
    name: str
    address: int
    size: int
    type: str

    def __hash__(self):
        return hash(self.name)