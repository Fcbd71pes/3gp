#!/bin/bash

# --- Mobile Video to 3GP Converter ---
# Author: [Your Name/GitHub Username]
# Description: A script to batch convert video files to low-quality 3GP format on Android using Termux.

# Check if FFmpeg is installed
if ! command -v ffmpeg &> /dev/null
then
    echo "Error: FFmpeg is not installed."
    echo "Please install it by running: pkg install ffmpeg"
    exit 1
fi

# Prompt the user for the folder path
echo "----------------------------------------------------"
echo "Please enter the full path to your video folder."
echo "Example: /storage/emulated/0/Download"
echo "Or: /storage/emulated/0/Movies/MyVideos"
echo "----------------------------------------------------"
read -p "Enter folder path: " FOLDER_PATH

# Prompt the user to choose the quality
echo ""
echo "Select the desired 3GP quality:"
echo "1. Lowest Quality (Very small file, 176x144, h263 codec)"
echo "2. Medium Quality (Better but still small, 320x240, mpeg4 codec)"
read -p "Enter your choice (1 or 2): " quality_choice

# Validate if the provided path is a directory
if [ -d "$FOLDER_PATH" ]; then
    cd "$FOLDER_PATH" || exit
else
    echo "Error: The specified folder does not exist. Exiting."
    exit 1
fi

# Set FFmpeg options based on user's choice
FFMPEG_OPTS=""
if [ "$quality_choice" == "1" ]; then
    # Lowest quality options for maximum compression
    # Video: 176x144, 15 fps, h263 codec, 128k bitrate
    # Audio: 8000 Hz, mono, amr_nb codec, 12.2k bitrate
    FFMPEG_OPTS="-s 176x144 -r 15 -vcodec h263 -b:v 128k -acodec amr_nb -ar 8000 -ac 1 -b:a 12.2k"
    echo "Lowest quality selected."
elif [ "$quality_choice" == "2" ]; then
    # Medium quality options for a balance
    # Video: 320x240, 20 fps, mpeg4 codec, 256k bitrate
    # Audio: 22050 Hz, mono, aac codec, 24k bitrate
    FFMPEG_OPTS="-s 320x240 -r 20 -vcodec mpeg4 -b:v 256k -acodec aac -ar 22050 -ac 1 -b:a 24k"
    echo "Medium quality selected."
else
    echo "Invalid input. Defaulting to Lowest Quality."
    FFMPEG_OPTS="-s 176x144 -r 15 -vcodec h263 -b:v 128k -acodec amr_nb -ar 8000 -ac 1 -b:a 12.2k"
fi

echo "Starting conversion process..."

# Loop through all common video files in the directory
# You can add more extensions here if needed (e.g., *.avi, *.mov)
for file in *.mp4 *.mkv *.webm *.flv *.mov *.avi; do
    # Check if the file actually exists to avoid errors
    if [ -f "$file" ]; then
        output_file="${file%.*}.3gp"
        echo "----------------------------------------------------"
        echo "Converting: $file"

        # Execute ffmpeg. If successful (&&), remove the original file.
        ffmpeg -i "$file" $FFMPEG_OPTS "$output_file" && rm "$file"

        # Check the exit status of the last command
        if [ $? -eq 0 ]; then
            echo "Success: '$file' -> '$output_file' (Original file deleted)"
        else
            echo "Failed: Could not convert '$file'."
        fi
    fi
done

echo "----------------------------------------------------"
echo "Process completed."
