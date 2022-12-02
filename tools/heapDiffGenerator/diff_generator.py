import sys, os, subprocess, argparse, difflib, atexit

# =======
# By PiNE
# =======

# note to self: fundamentally, a flaw with this whole thing is that
# the the addrs changed is sectioned into 4 bytes. If there's some byte that changes
# and the other bytes around it doesn't, this will mark all those as changed
# ...... my hope is that the mem regions will be widespread enough that those little things
# won't matter since i'll be just copying huge chunks of memory anyway

# heap_regions.txt is the file the script uses to organize mem regions


# -----------------------------------
if (len(sys.argv) < 2):
    print("Missing memdump directory argument. The cmd should look something like: diff_generator.py C:/PATH_TO_MEMDUMPS/memdumps")
    quit()
MEMDUMP_DIR_BASE = sys.argv[1]
print("Memdump directory: " + MEMDUMP_DIR_BASE)
# -----------------------------------

CHANGED_ADDRS_FILENAME = "changed_addrs.txt"
HEAP_REGIONS_OUTPUT_FILENAME = "heap_regions_output.txt"

def erase_memdump_dir_base(path : str):
    return path.replace(MEMDUMP_DIR_BASE, "")
def is_in_range(x, min, max):
    return x >= min and x <= max



def merge_heap_regions(current_iter_heap_regions: dict, output_dict: dict):
    for key in current_iter_heap_regions.keys():
        skip = False
        if key not in output_dict:
            output_dict[key] = []

        for heap_region_cumulative in output_dict[key]:

            for heap_region_iter in current_iter_heap_regions[key]:
                
                if heap_region_cumulative and heap_region_iter:

                    # check if iter start/end addr is within the cumulative ones. If so, extend the cumulative's boundaries
                    # if iter start/end is in range
                    iter_start_in_range = is_in_range(heap_region_iter[0], heap_region_cumulative[0], heap_region_cumulative[1])
                    iter_end_in_range = is_in_range(heap_region_iter[1], heap_region_cumulative[0], heap_region_cumulative[1])

                    if iter_start_in_range and not iter_end_in_range: # extend end
                        heap_region_cumulative[1] = heap_region_iter[1]
                    elif not iter_start_in_range and iter_end_in_range: # extend start
                        heap_region_cumulative[0] = heap_region_iter[0]

                    is_heap_region_same = heap_region_cumulative[0] == heap_region_iter[1] and heap_region_cumulative[1] == heap_region_iter[1]
                    is_heap_region_in_range = iter_start_in_range and iter_end_in_range
                    if is_heap_region_same or is_heap_region_in_range:
                        skip = True # if heap region is a duplicate, skip
                        break
                

        if not skip:
            output_dict[key] += current_iter_heap_regions[key]

# takes in array of [ [address, heap name], ... ]
# (addresses should be already sorted)
# and merges entires that have addresses right next to each other
# returns a dict: key = heap name, value = [start address, end address, heap name] 
def get_concise_heap_region_changes(heap_output):
    # key is name of heap region, value is an array of regions that changed
    heaps = {}

    for heap_info in heap_output:
        addr = int(heap_info[0], 16)
        heap_name = heap_info[1]
        if heap_name not in heaps:
            heaps[heap_name] = []
            heaps[heap_name].append([addr, addr, heap_info[1]])
        else:
            latest_heap_region = heaps[heap_name][-1]
            # we need to expand the mem region
            if latest_heap_region[1] == addr-16 and heap_name == latest_heap_region[2]: 
                latest_heap_region[1] = addr
            # if it's an entirely new heap region
            elif latest_heap_region[0] > addr or latest_heap_region[1] < addr:
                heaps[heap_name].append([addr, addr, heap_info[1]])
    
    return heaps


def parse_heap_regions(changed_addrs_filename, heap_regions_filename):
    addr_file = open(changed_addrs_filename)
    heap_regions_file = open(heap_regions_filename)
    heap_regions = []
    for line in heap_regions_file.readlines():
        start_address = line[line.find("{")+1 : line.find(",")]
        end_address = line[line.find(",")+2 : line.find(",", line.find(",")+1)]
        heap_name = line[line.find("},")+2 : len(line)].strip()
        heap_regions.append( [start_address, end_address, heap_name] )

    heap_output = []
    for addr in addr_file.readlines():
        addr = addr.replace("\n", "")
        addr_int = int(addr, 16)
        for (start, end, heap_name) in heap_regions:
            if addr_int >= int(start, 16) and addr_int <= int(end, 16):
                output = "Addr: " + str(addr) + "    " + heap_name
                heap_output.append((str(addr), heap_name))

    heap_output.sort(key=lambda heap_info: heap_info[0]) # sort addresses

    # take heap region changes and merge regions that are next to each other
    concise_heap_regions = get_concise_heap_region_changes(heap_output)

    print("Parsed heap regions for " + erase_memdump_dir_base(changed_addrs_filename))

    return concise_heap_regions

# every line of the diff file is passed through here
def cleanup_parsed_diff_line(line, is_mem2, changed_addrs_filename):
    if line[1] == '1' or line[1] == '0':
        addr = line[1 : line.find(" ", 1)]
        addr_prefix = "0x8"
        if is_mem2:
            addr_prefix = "0x9"
        addr = addr_prefix + addr
        if not os.path.exists(changed_addrs_filename): # create file if it doesn't exist
            f = open(changed_addrs_filename, "w")
            f.close()
        f = open(changed_addrs_filename, "a")
        f.write(addr + "\n")
        f.close()
        
    return line

# takes the dir to the hexdump-ed binary files (.txt files), 
# along with the dir to the base hexdump-ed files to compare against
# and finally, the current dump iteration
def parse_mem_differences(memdump_dir, base_memdump_filepath, dump_num):
    changed_addrs_filename = memdump_dir + "/" + CHANGED_ADDRS_FILENAME
    # if there's already a changed_addrs.txt, that means we already parsed the mem differences for this dump folder
    if os.path.exists(changed_addrs_filename):
        return

    # base files. These are the files that all memdumps get compared to - they are the first memdump out of however many were dumped during a match
    mem1_first = base_memdump_filepath + "/mem1_" + str(dump_num-1)
    mem2_first = base_memdump_filepath + "/mem2_" + str(dump_num-1)

    # these are the current iteration of the parsing loop. Compare these against the base files
    mem1_second = memdump_dir + "/mem1_" + str(dump_num) # no extension -- memdumps/dumpX/mem1_X
    mem2_second = memdump_dir + "/mem2_" + str(dump_num)

    # filename to store the diff of the base/current iteration in
    mem1_diff = memdump_dir + "/mem1_diff"
    mem2_diff = memdump_dir + "/mem2_diff"

    mem1_files = (mem1_first, mem1_second, mem1_diff)
    mem2_files = (mem2_first, mem2_second, mem2_diff)

    # parse hexdump(s)
    print("Parsing hexdumps for dump #" + str(dump_num) + "...")
    for (before, after, diff) in [mem1_files, mem2_files]:
        before_filename = before + ".txt"
        after_filename = after + ".txt"
        before_file = open(before_filename)
        after_file = open(after_filename)
        before_string = before_file.readlines()
        after_string = after_file.readlines()

        output_filename = diff + ".txt"
        output_file = open(output_filename, "w")

        print(f"Generating diff for {erase_memdump_dir_base(before_filename)} -> {erase_memdump_dir_base(after_filename)}")
        for line in difflib.unified_diff(before_string, after_string):
            cleaned_line = cleanup_parsed_diff_line(line, "mem2" in before, changed_addrs_filename)
            output_file.write(cleaned_line)
            
        output_file.close()
        before_file.close()
        after_file.close()
        print(f"Successfully generated difference! See {erase_memdump_dir_base(output_filename)}")

# takes a dir that should contain mem1/2.raw binary files
# then hexdumps those files into .txt's, and parses the differences
# between those hexdumped files and some base hexdumps
def dump_and_parse(memdump_dir, base_memdump_filepath, dump_num):
    mem1_file = memdump_dir + "/mem1_" + str(dump_num)
    mem2_file = memdump_dir + "/mem2_" + str(dump_num)

    # only hexdump if they don't already exist
    if not os.path.exists(mem1_file + ".txt") or not os.path.exists(mem2_file + ".txt"):
        # hexdump binary files
        print(f"hexdumping {erase_memdump_dir_base(mem1_file)}")
        os.system(f"hexdump {mem1_file}.raw > {mem1_file}.txt")
        print(f"hexdumping {erase_memdump_dir_base(mem2_file)}")
        os.system(f"hexdump {mem2_file}.raw > {mem2_file}.txt")

    # parse differences between the current hexdumps and the base ones
    parse_mem_differences(memdump_dir, base_memdump_filepath, dump_num)


heap_regions_dic = {}

def main():
    # dump0
    initial_dump = MEMDUMP_DIR_BASE + "/dump0"
    if not os.path.exists(initial_dump + "/mem1_0.txt") or not os.path.exists(initial_dump + "/mem2_0.txt"):
        print("Hexdumping initial dump...")
        mem1_cmd = "hexdump " + (initial_dump + "/mem1_0.raw") + " > " + (initial_dump + "/mem1_0.txt")
        os.system(mem1_cmd)
        mem2_cmd = "hexdump " + (initial_dump + "/mem2_0.raw") + " > " + (initial_dump + "/mem2_0.txt")
        os.system(mem2_cmd)
    
    
    # iterate through folders in memdumps folder and hexdump/diff them all    
    dump_num = 1
    memdump_dir = MEMDUMP_DIR_BASE + "/dump" + str(dump_num)
    base_memdump_filepath = initial_dump
    while os.path.exists(memdump_dir):
        print("Dump #" + str(dump_num))
        dump_and_parse(memdump_dir, base_memdump_filepath, dump_num)

        print("Parsing heap regions...")
        # parse heap regions
        current_iter_heap_regions = parse_heap_regions(memdump_dir + "/" + CHANGED_ADDRS_FILENAME, "heap_regions.txt")
        # merge similar/adjacent heap regions and add to heap_regions_dic
        merge_heap_regions(current_iter_heap_regions, heap_regions_dic)
        print("Merged heap regions into cumulative dictionary")


        dump_num += 1
        base_memdump_filepath = memdump_dir # set base to previous ( diffs the current mem dump with the previous )
        memdump_dir = MEMDUMP_DIR_BASE + "/dump" + str(dump_num)

    
    print("Success! See " + HEAP_REGIONS_OUTPUT_FILENAME)


def sort_and_write_heap_regions():
    print("Writing heap regions to file...")
    for v in heap_regions_dic.values():
        v.sort(key=lambda heap_info: heap_info[0]) # sort addresses

    # write heap_regions_dic contents to file in same format that Savestates.cpp uses for mem regions
    heap_regions_output = open(HEAP_REGIONS_OUTPUT_FILENAME, "w")
    for k,v in heap_regions_dic.items():
        heap_regions_output.write("// " + k + "\n")
        for region in v:
            start_addr = hex(region[0])
            end_addr = hex(region[1])
            heap_name = k
            output_str = f"{{ {str(start_addr)}, {str(end_addr)}, nullptr, \"{heap_name}\" }},\n"
            heap_regions_output.write(output_str)
        heap_regions_output.write("\n\n")
    print("Wrote heap regions to file! See" + HEAP_REGIONS_OUTPUT_FILENAME)
    
# when program exists, sort & write heap regions output to file
# doing this on program exit so that you can cancel the process early and not lose progress
atexit.register(sort_and_write_heap_regions)

if __name__ == "__main__":
    main()