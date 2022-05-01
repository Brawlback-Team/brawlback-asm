from Library import Library
from File import File
from Section import Section
import os
from typing import List

class LibraryDirectory:

    def __init__(self, directory: str, libraryType=Library):
        assert os.path.exists(directory)
        self.directory = directory
        self._sections = None
        self._symbols = None
        self._libraries = None
        self.libraryType = libraryType

    @property
    def sections(self):
        if self._sections is None:
            self._sections = set()
            for lib in self.libraries:
                self._sections |= lib.sections

        return self._sections

    @property
    def symbols(self):
        if self._symbols is None:
            self._symbols = set()
            for lib in self.libraries:
                self._symbols |= lib.symbols

        return self._symbols

    @property
    def libraries(self):
        if self._libraries is None:
            self._libraries = []
            for file in os.listdir(self.directory):
                lib = self.libraryType(f"{self.directory}/{file}")
                self._libraries.append(lib)

        return self._libraries

    def renameSections(self, name2NewName: dict, newDirectory: str):
        assert os.path.exists(newDirectory)
        renameCommands = [f"--rename-section {name}={newName}" for name, newName in name2NewName.items()]
        return self.objcopy(newDirectory, ' '.join(renameCommands))

    def removeSections(self, sections2Remove, newDirectory):
        renameCommands = [f"--remove-section {section}" for section in sections2Remove]
        return self.objcopy(newDirectory, ' '.join(renameCommands))

    def objcopy(self, newDirectory, options):
        for lib in self.libraries:
            newLib = File(f"{newDirectory}/{lib.name}")
            lib.objcopy(options, newLib)
        else:
            return LibraryDirectory(newDirectory)

    def constructors(self) -> List[Section]:
        constructors = []
        for lib in self.libraries:
            constructors.extend(lib.constructors())
        else:
            return constructors