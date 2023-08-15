import sys, socket, select, io
import argparse

class MyParser(argparse.ArgumentParser): 
   def error(self, message):
      sys.stderr.write('error: %s\n' % message)
      self.print_help()
      sys.exit(2)

if __name__ == "__main__":
    parser = MyParser(usage='%(prog)s [options] IP Address')
    parser.add_argument("ipaddress", help="IP Address of the Nintendo Switch", metavar="IP Address")
    parser.add_argument("-o", help="Sets output File", metavar="OUTPUT", nargs="?", dest="output", default=None)
    args = parser.parse_args()

    serverAddressPort   = (args.ipaddress, 6969)
    bufferSize          = 256

    sock = socket.socket(family=socket.AF_INET, type=socket.SOCK_DGRAM)
    sock.settimeout(5)

    if args.output != None:
        f = open(args.output,'w+')

    while True:
        connected = False
        while not connected:
            print('Sending handshake.')
            # Send to server using created UDP socket
            sock.sendto(str.encode("Hello"), serverAddressPort)
            try:
                reply, addr = sock.recvfrom(bufferSize)
                if reply.decode('utf-8'):
                    connected = True
                else:
                    print(f'recived {reply.decode("utf-8")}')
            except socket.timeout:
                continue

        print('Entering loop.')
        while connected:
            try:
                ready_to_read, ready_to_write, in_error = select.select([sock,], [sock,], [], 5)
            except select.error:
                sock.shutdown(2)
                sock.close()
                print('Client has disconnected')
                connected = False
            if len(ready_to_read) > 0:
                data = sock.recvfrom(bufferSize)
                print(data[0].decode('utf-8'), end='')
                if args.output != None:
                    f.write(data[0].decode('utf-8') + '\n')
    if args.output != None:
        f.close()