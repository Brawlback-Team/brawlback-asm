### Registers:

register | value
:--- | :--- 
r4 | *[0] the selected command
r21 | zero (again) ?
r22 | negative one (-1)
r23 | unknown
r26 | `aiAct *`
r27 | Pointer to AI's left stick x, y (floats)
r28 | Pointer to AI's Button Inputs
r29 | Pointer to next instruction
r30 | *[1] arguments. if args\[arg\] + 1 = `\0` \then it is null.
f26 | some form of zero
f27 | unknown
f28 | unknown
f29 | unknown

- *[0] - the address of this is r30 (args)
- *[1] - technically, this appears to be the position of script execution + 4.