import json
import os
from dataclasses import dataclass, field
from Segment import Segment

@dataclass
class Settings:
    CODE_SEGMENTS: list
    INFO_SEGMENT_ADDRESS = int("0x935D0000", 0)
    INFO_SEGMENT_ADDRESS: int
    DATA_SEGMENT_ADDRESS = field(init=False)
    DATA_SEGMENT_ADDRESS: int
    MEMORY_HEAP_END_ADDRESS = int("0x935E0000", 0)
    MEMORY_HEAP_END_ADDRESS: int
    INITIALIZER_INFO_ADDRESS = int("0x81500000", 0)
    INITIALIZER_INFO_ADDRESS: int
    INITIALIZER_SEGMENT_ADDRESS = int("0x81410000", 0)
    INITIALIZER_SEGMENT_ADDRESS: int

    def __post_init__(self):
     self.DATA_SEGMENT_ADDRESS = self.INFO_SEGMENT_ADDRESS + int("0x3000", 0)

def get_settings(settingsPath):
 if os.path.exists(settingsPath):
   with open(settingsPath, 'r') as f:
      j = json.load(f)
      return Settings([Segment(int(codeSegment["startAddress"],0), int(codeSegment["endAddress"], 0)) for codeSegment in j["codeSegments"]],
                      int(j["infoSegmentAddress"],0),
                      int(j["memoryHeapEndAddress"],0),
                      int(j["initializerInfoAddress"],0),
                      int(j["initializerSegmentAddress"],0))
 else:
  return Settings(CODE_SEGMENTS=[
      Segment(int("0x8055A600", 0), int("0x80563100", 0)),
      Segment(int("0x805B5200", 0), int("0x805B61D0", 0)),
      Segment(int("0x817CE880", 0), int("0x817DA590", 0))])

## Sample settings.json
# { "codeSegments": [
#   {
#     "startAddress": "0x8055A600",
#     "endAddress": "0x80563100"
#   },
#   {
#     "startAddress": "0x805B5200",
#     "endAddress": "0x805B61D0"
#   },
#   {
#     "startAddress": "0x817CE880",
#     "endAddress": "0x817DA590"
#   }],
#   "infoSegmentAddress": "0x935D0000",
#   "memoryHeapEndAddress": "0x935E0000",
#   "initializerInfoAddress": "0x81500000",
#   "initializerSegmentAddress": "0x81410000"
# }