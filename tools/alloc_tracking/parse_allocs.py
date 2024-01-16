import sys, os
from dataclasses import dataclass

ALLOC_FILE_NAME = "allocs.log"

@dataclass
class AllocInfo:
    size: int
    allocated_addr: int
    callstack: str


def parse_alloc_infos_from_file(allocs_filepath: str):
    alloc_infos_to_return = []
    allocs_file = open(allocs_filepath, "r")
    lines = allocs_file.readlines()
    for i in range(len(lines)):
        line = lines[i]
        if "ALLOC" in line:
            # parse this alloc

            # get size
            alloc_size_startidx = line.find("0x")+2
            alloc_size = int(line[alloc_size_startidx : alloc_size_startidx+8], 16)

            # get allocated addr
            alloc_addr_startidx = line.find("0x", alloc_size_startidx)+2
            alloc_addr = int(line[alloc_addr_startidx : alloc_addr_startidx+8], 16)

            # get callstack string, will have each function call split with \n
            callstack_line_idx = i+1
            callstack_line = lines[callstack_line_idx]
            callstack_full_string = ""
            while ("[ addr = " in callstack_line or callstack_line == "\n"):
                if callstack_line != "\n": 
                    callstack_line = callstack_line[callstack_line.find("*")+2 : callstack_line.find("[ addr = ")-1]
                    callstack_full_string += (callstack_line + "\n")

                callstack_line_idx += 1
                if (callstack_line_idx >= len(lines)): break
                callstack_line = lines[callstack_line_idx]
            i = callstack_line_idx

            allocinfo = AllocInfo(alloc_size, alloc_addr, callstack_full_string)
            alloc_infos_to_return.append(allocinfo)

    print("Parsed alloc infos from file!")
    return alloc_infos_to_return

def main():
    alloc_infos = parse_alloc_infos_from_file(ALLOC_FILE_NAME)
    print("")
    args = sys.argv[1:]
    if len(args) > 0:
        address_to_find = int(args[0], 16)
        print("Searching for address: " + str(address_to_find) + "\n")
        relevant_infos = {}
        for info in alloc_infos:
            if info.allocated_addr <= address_to_find <= info.allocated_addr + info.size:
                relevant_infos[info.allocated_addr] = info
        for addr, info in relevant_infos.items():
            print("Allocated addr = " + str(info.allocated_addr) + " size = " + str(info.size))
            print(info.callstack)

if __name__ == "__main__":
    main()