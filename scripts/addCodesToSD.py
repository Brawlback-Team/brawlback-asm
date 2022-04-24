import os
import shutil


baseSDPath = "Project+/codes"
codeFolder = R"C:\Users\johno\CLionProjects\ProjectMCodes\cmake-build-debug-mingw-powerpc\Output"
#sdPath = R"C:\Users\johno\Documents\Project+v2.15_C++\sd.raw"
sdPath = R"C:\Users\johno\Documents\Modding\Dolphin\SD_Raws\sd.raw"
mountDrive = 'G'

try:
	os.system(Rf"osfmount.com -a -t file -f {sdPath} -m {mountDrive}: -o rw")
except Exception as e:
	print(e)
	input("Press enter to exit...")
	quit()

if not os.path.exists(f"{mountDrive}:/{baseSDPath}"):
	os.mkdir(f"{mountDrive}:/{baseSDPath}")

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


try:
	os.system(f"osfmount.com -D -m {mountDrive}:")
except Exception as e:
	print(e)
	input("Press enter to exit...")
