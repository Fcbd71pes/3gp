# Mobile Video to 3GP Converter

A simple and powerful shell script to batch convert video files to low-quality 3GP format directly on an Android device using Termux. This is perfect for reducing video file sizes for sharing or saving storage space.

## Features

-   **Batch Conversion**: Converts all video files within a specified folder.
-   **Quality Options**: Choose between "Lowest" and "Medium" quality for conversion.
-   **Automatic Cleanup**: Deletes the original video file after a successful conversion to save space.
-   **User-Friendly**: Interactive prompts guide you through the process.
-   **Lightweight**: Runs entirely within the Termux terminal environment.

## Requirements

-   An Android device.
-   [Termux](https://f-droid.org/en/packages/com.termux/) app installed from F-Droid (recommended).
-   Storage permission granted for Termux.

## Quick Start: One-Command Setup & Run

This single command will do everything for you: update packages, install the necessary tools (`ffmpeg` and `curl`), download the script, make it executable, and run it for the first time.

Just copy the entire command below and paste it into your Termux terminal:

```bash
pkg update && pkg upgrade -y && pkg install ffmpeg curl -y && curl -L -O https://raw.githubusercontent.com/Fcbd71pes/3gp/main/3gp/video-converter.sh && chmod +x video-converter.sh && ./video-converter.sh
