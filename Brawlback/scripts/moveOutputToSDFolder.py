import os
import shutil

current_dir = os.getcwd() + "\\"

SDFolder = current_dir + "SDCard\\Project+\\codes\\"
buildOutput = current_dir + "build\\Output\\"


for file in os.listdir(buildOutput):
    try:
        shutil.copy(f"{buildOutput}\\{file}", f"{SDFolder}\\{file}")
        #print("Adding", file)
    except Exception as e:
        print(e)

print("Copied files successfully!")