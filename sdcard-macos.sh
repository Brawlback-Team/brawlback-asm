#!/bin/bash

# Save the current directory.
CURRENT_DIR="$(pwd)"

# Change to the directory containing the script.
cd "$(dirname "$0")"

VOLUME_NAME="BrawlbackSDCard"
MOUNT_DRIVE="/Volumes/$VOLUME_NAME"
SD_CARD1_PATH="./sdcard1"
SD_CARD2_PATH="./sdcard2"

# Define the relative path of the folder to copy to the SD card.
SD_CARD_FOLDER="./SDCard"

# Define the size of the SD card image.
SD_CARD_SIZE="3g"

# Define an array of the SD card paths.
SD_CARDS=("$SD_CARD1_PATH" "$SD_CARD2_PATH")

for sd_card_path in "${SD_CARDS[@]}"; do
  # Check if the SD card image already exists.
  if [ -f "$sd_card_path.raw" ]; then
    echo "Mounting existing SD card: $sd_card_path"
  else
    echo "Creating new SD card: $sd_card_path"
    hdiutil create -size "$SD_CARD_SIZE" -fs "FAT32" -volname "VOLUME_NAME" "$sd_card_path"
  fi

  if [ -f "$sd_card_path.raw" ]; then
    # Rename the SD card image file to .dmg temporarily
    mv "$sd_card_path.raw" "$sd_card_path.dmg"
  fi

  # Mount the SD card image.
  echo "Mounting SD card: $sd_card_path.dmg"
  hdiutil attach -nobrowse -mountpoint "$MOUNT_DRIVE" "$sd_card_path.dmg"

  # Copy the contents of the specified folder to the SD card.
  echo "Copying files to SDCard: $SD_CARD_FOLDER => $MOUNT_DRIVE"
  cp -R "$SD_CARD_FOLDER/." "$MOUNT_DRIVE"

  # Unmount the SD card image.
  echo "Unmounting SD card: $MOUNT_DRIVE"
  hdiutil detach "$MOUNT_DRIVE"

  # Rename the SD card image file to .raw
  mv "$sd_card_path.dmg" "$sd_card_path.raw"
done

# Restore the current directory.
cd "$CURRENT_DIR"