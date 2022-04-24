# Installing These Mods

These mods have been created using this build pipeline for developing mods
using c++ as opposed to building them by-hand via typical ASM. The way they
get loaded is also a bit different than *normal* gecko codes in that 
they're placed at the root of the SD card and get loaded using a single 
gecko code.

**for now**, I have placed a working build of the AI debugging code I
developed in the "codes" folder. All of its files will be in the "AIDebug"
folder.

Here is a direct link to that folder: [guides/codes/AIDebug](./codes/AIDebug)

### Warning:

doing this with the netplay `sd.raw` will cause it to desync - therefore
it is recommended to make a copy of your sd.raw before doing this to ensure
you won't need to re-download the full build whenever you wish to play netplay
again.

---

Here are the steps to actually install this code for Project+:

1. move everything except `LoadSetupFile.asm` into the root of the SD card.
2. move `LoadSetupFile.asm` into the `Project+/Source` directory
3. find `RSBE01.txt` (or `PPLUSNETPLAY.txt`), open it, and add
    the following line after the second-to-last line:
    - `.include source/LoadSetupFile.asm` 
4. locate `GCTRealMate.exe`
5. click and drag the text file you modified onto `GCTRealMate.exe`. This
    will generate a `.GCT` file of the same name. Take the generated `.GCT` 
    file and put it where you found its text file. You can overwrite
    whatever GCT was there before.
6. as long as everything is where it should be (all the `.bin` files at the root
    along and the updated `.GCT` in-place), you should be able to launch the
    game and have it work
    
Now that you have that `LoadSetupFile.asm` injected into the GCT file, if you wish
to use other codes that have been built with Fracture's compiler, you only need
to replace all the `.bin` files at the root of the sd card with whatever
`.bin` files come with the new code.

Thank you for following this setup guide!

\- fudgepop01

---

## Using the AI Debugging code:

When starting a battle in either vs mode or training mode, every character will have 
a box drawn to their right. This will contain information about who that AI is targeting,
as well as their inputs as seen by the game (note: "inputs" means attack, special, shield,
etc. as opposed to "A B X Y etc.").

If there are two or more fighters, a large box will be generated near the top of the screen.
This contains data about whatever AI is loaded as player 2. This contains, from top to bottom:

1. what routine you have selected
2. what routine the AI is currently executing
3. the AI's inputs
4. how long the AI has been running that current routine
5. a list of the 26 variables the AI can use when executing its routines

### Selecting Routines:

Upon starting a match, the AI will likely do nothing. This is because you need to select 
the routine the AI uses by holding `Z` and pressing left or right on the dpad for
5 frames. You can also turn their  behavior back to normal and back by 
holding `Z` and pressing down on the dpad for 5 frames. When the AI is executing default 
behavior you'll see "DEFAULT" in the place where your selected routine would normally be.

### Note about Routines:

Though it only shows the data of a single CPU, selecting routines will set that routine
for ALL CPUs. This means that if you wanted to have a bunch of roys use ONLY DACUS, you can
by setting the selected routine to `4058` because it'll apply to ALL the AI present.

### AI Debug Mode

I just (as of 7/25/2020) added a debug mode to the code. Activate it by pressing left/right on
the dpad while on "DEFAULT." This special mode is tailor-made for testing AI. While in this mode, 
your position and damage will snap back to a previous location if the number of hitstun frames 
remaining (offset by an adjustable value) reaches 0. 

to disable this mode, simply go back to DEFAULT.

#### Debug Mode Controls

control stick:
- moves you around.
  - note: to leave the ground you must jump or already be in the air.
  - the info box can show you where your character will try to warp to

dpad without Z:
- `up / down`: increase / decrease your damage
- `left / right`: increase / decrease the hitstun timer offset

dpad **WITH** Z:
- same controls as before
