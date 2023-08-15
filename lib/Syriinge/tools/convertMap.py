import sys, re


if len(sys.argv) > 1:
    outFile = open(sys.argv[3],'w+')
    outFile.write('.text\n')
    with open(sys.argv[1],'r') as f:
        lines = f.readlines()
        found = False
        x = 0
        while x < len(lines):
            line = lines[x]
            if not found:
                if '.text section layout' not in line:
                    x += 1
                    continue
                else:
                    found = True
                    x += 4
                    continue
            if line == '\n':
                break
                
            match = re.match(r'\s{2}([\dA-f]+)\s([\dA-f]+)\s[\dA-f]+\s[\dA-f]+\s{2}\d\s(\w+)', line)
            if match:
                addr = int(match.group(1), 16)
                addr += int(sys.argv[2], 16)
                size = int(match.group(2), 16)
                sym = match.group(3)
                outFile.write(f'{addr:08X} {size:08X} {addr:08X} 0 {sym}\n')
            x += 1
    outFile.close()
else:
    print('[map file] [address] [output]')