Integers are non decimal numbers (1, 17, 192)  
Numbers with decimals default to 8 byte doubles (1.5, .3, 12.)  
Decimals prefixed with 'f' are 4 byte floats (1.5f, .3f, 12.f)  
Bool literals (true, false)  
String literals are text surrounded by "".  Strings are implemented as std::string, so use them the same way ("Hello, World!", "\"quote\"")  

Most operations work like C++  
&& is replaced by "and", || is replaced by "or" (no quotes)

You can use the names of common registers to access their values
Implemented registers are:  
- gpr (r[0-31])
- fpr (f[0-31])
- pc (pc, PC)
- cr (cr returns entire 4 byte value, cr[0-7] return 4 bit value)
- ctr (ctr, CTR)
- lr (lr, LR)

Use [] to access memory. Prepend the brackets with:
- s to read a null terminated string (s[0x80000000] == "RSBE01")
- f to read a 4 byte float
- d to read an 8 byte double
- h to read a 2 byte half (h[0x80000000] == 0x5253)
- c to read one byte (h[0x80000000] == 0x52)
- b to read 1 byte and convert it to a bool (b[0x80000000] == true)
- Don't prepend it with anything to read a 4 byte integer ([0x80000000] == 0x52534245)

Use the size() function to get the size of an argument.  Works on all data types (size("test") == 4, size(1.5) == 8, size(1.5f) == 4)  
Numeric types can be converted to shorts and bytes using the short() and byte() functions (byte(0x123) == 0x23, short(1.5) == 1)

You can name watches and use them in other expressions using $name.  
Breakpoints also get the variable $i, which is the number of times the bp has been hit.  
Memory breakpoints also get $old and $new, which are the values before and after a memory access, and $addr, which is the address of the access.  
The size and type of $old and $new depend on the size of the memory access.  
8 byte accesses are guaranteed to be doubles, but everything else is a sized integer.

You can add another expression that will be evaluated when the BP is triggered and written to the log.  
Instruction BPs have an additional condition that determines if they will write to the log.  
If the condition is empty, it defaults to the break condition.  
You can set the break condition to false and the log condition to something else to write to log without breaking.
