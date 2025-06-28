# builds brawlback-asm and creates sd.raw
set -eux

WORK_DIR='build'

make

mkdir -p $WORK_DIR

pushd $WORK_DIR


# clean previous artifacts
rm -rf sd User

# download project+ zip
pplus_dolphin_zip_path="pplus.zip"
pplus_dolphin_zip_hash="3814a85a537ebb199c9ba74e0ebb03cf"

if [ ! -e "$pplus_dolphin_zip_path" ]; then
    wget -O $pplus_dolphin_zip_path  https://github.com/jlambert360/PPlusReleases/releases/download/v3.1.2/Project+.v3.1.2.Netplay.Windows.zip
fi

# check hash
hash=$(md5sum "$pplus_dolphin_zip_path" | awk '{print $1}')

if [ "$hash" != "$pplus_dolphin_zip_hash" ]; then
    echo "Hash does not match. The download may be invalid or a new Project+ version may have been released."
    exit 1
fi


# extract sd.raw
unzip $pplus_dolphin_zip_path User/Wii/sd.raw
7z x -osd User/Wii/sd.raw


# place brawlback files
# sy_core.rel
cp ../sy_core.rel sd/Project+/pf/module/sy_core.rel

# Brawlback-Online.rel
cp ../Brawlback-Online.rel sd/Project+/pf/plugins/Brawlback-Online.rel

# remove Physics.rel
rm sd/Project+/pf/plugins/Physics.rel

# BrawlbackUtils.asm
cp ../BrawlbackUtils.asm sd/Project+/Source/Community/BrawlbackUtils.asm

# edit RSBE01.txt and build
# insert '.include Source/Community/BrawlbackUtils.asm' after '.include Source/Community/Syringe.asm'
sed -i '/\.include Source\/Community\/Syringe\.asm/a.include Source/Community/BrawlbackUtils.asm' sd/Project+/RSBE01.txt

# couldn't figure out why the linux build of GCTRealMate doesn't work
pushd sd/Project+

# must use an absolute path for GCTRealMate.exe args
fullpath=$(realpath ./RSBE01.txt)
cp ../../../tools/GCTRealMate ./GCTRealMateLinux

./GCTRealMateLinux -q $fullpath

popd


# create sd image(2.5gb)
# https://dolphin-emu.org/docs/guides/virtual-sd-card-guide/#Generating_SD_Cards_with_Third_Party_Tools
sd_image_filename="brawlback-$(git rev-parse --short HEAD)$(git diff --quiet || echo -dirty)-$(date '+%Y-%m-%d-%H-%M')_sd.raw"
dd if=/dev/zero bs=1M count=2560 of="$sd_image_filename"

# format sd image
mkfs.fat -F 32 $sd_image_filename

# recursively copy sd/Project+ to the root of sd.raw
# https://www.gnu.org/software/mtools/manual/html_node/mcopy.html
# use `mdir -/ab -i sd.raw` for checking
mcopy -i $sd_image_filename -s sd/Project+ ::/

popd

echo "Successfully created $sd_image_filename"