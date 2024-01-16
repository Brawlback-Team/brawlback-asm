import os
from pathlib import Path

class File:

    def __init__(self, path):
        self.path = Path(os.path.abspath(path)).as_posix()
        self.name = Path(path).name

    def read(self):
        with open(self.path, 'r') as (file):
            data = file.read()
        return data

    def readBinary(self):
        with open(self.path, 'rb') as (file):
            data = file.read()
        return data

    def write(self, text):
        with open(self.path, 'w') as (file):
            file.write(text)

    def writeBinary(self, data: bytes):
        with open(self.path, 'wb') as (file):
            file.write(data)

    def exists(self):
        return os.path.exists(self.path)

    def size(self):
        return os.stat(self.path).st_size
        