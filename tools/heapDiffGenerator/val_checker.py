import sys, os
from dataclasses import dataclass

if len(sys.argv) < 2:
    print("Insufficient args")
    quit()

@dataclass
class Addr:
    start: int
    end: int
    name: str

heap_regions = []

file = open("heap_regions.txt", "r")
for line in file.readlines():
    first_comma_idx = line.find(",")
    start_addr = line[line.find("{")+1 : first_comma_idx]
    end_addr = line[first_comma_idx+2 : line.find(",", first_comma_idx+1)]
    heap_name = line[line.rfind(",")+2 : ]
    this_heap = Addr(int(start_addr, 0), int(end_addr, 0), heap_name)
    heap_regions.append(this_heap)
file.close()

val_to_check = int(sys.argv[1], 16)

for heap_info in heap_regions:
    if val_to_check <= heap_info.end and val_to_check >= heap_info.start:
        print("That value resides in: " + heap_info.name)
        quit()
print("Unknown mem region!")
