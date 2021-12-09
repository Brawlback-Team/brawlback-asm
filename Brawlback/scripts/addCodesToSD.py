import os
import shutil
#from sh import mount

is_windows = True

baseSDPath = "Project+/codes"
if is_windows:
    codeFolder = R"C:\Users\gclar\Desktop\Brawlback\build\Output"
else:
    codeFolder = R"/mnt/c/Users/gclar/Desktop/Brawlback/build/Output"

#sdPath = R"C:\Users\johno\Documents\Project+v2.15_C++\sd.raw"
#sdPath = R"C:\Users\johno\Documents\Modding\Dolphin\SD_Raws\sd.raw"

if is_windows:
    sdPath = R"C:\Games\Project+ v2.29 Netplay (Windows)\User\Wii\sd.raw"
else:
    sdPath = R"/mnt/c/Games/Project+ v2.29 Netplay (Windows)/User/Wii/sd.raw"
mountDrive = 'D'

""" # figure out how to actually mount sd card from cmd/wsl
try:
	os.system(Rf"mount {sdPath} {mountDrive} -o loop")
except Exception as e:
	print(e)
	input("Press enter to exit...")
	quit()
"""
try:
    if not os.path.exists(f"{mountDrive}:/{baseSDPath}"):
	    os.mkdir(f"{mountDrive}:/{baseSDPath}")
except Exception as e:
    print(e)
    print("Couldn't get mounted drive! Is it even mounted?")
    quit()

print()
for file in os.listdir(f"{mountDrive}:/{baseSDPath}"):
    try:
        os.remove(f"{mountDrive}:/{baseSDPath}/{file}")
        print("Removing", file)
    except Exception as e:
        print(e)
print()


for file in os.listdir(codeFolder):
    try:
        shutil.copy(f"{codeFolder}/{file}",
                    f"{mountDrive}:/{baseSDPath}/{file}")
        print("Adding", file)
    except Exception as e:
        print(e)
print()

""" # unmount
try:
	os.system(f"osfmount.com -D -m {mountDrive}:")
except Exception as e:
	print(e)
	input("Press enter to exit...")
"""

print("Finished transfering to sd!")