# Mobile Video to 3GP Converter

A simple and powerful shell script to batch convert video files to low-quality 3GP format directly on your Android device using Termux. This is perfect for reducing video file sizes for sharing or saving space.

## Features

-   **Batch Conversion**: Converts all video files in a specified folder.
-   **Quality Options**: Choose between "Lowest" and "Medium" quality for conversion.
-   **Automatic Cleanup**: Deletes the original video file after a successful conversion to save space.
-   **Easy to Use**: Interactive prompts guide you through the process.
-   **Lightweight**: Runs entirely within the Termux terminal environment.

## Requirements

-   An Android device.
-   [Termux](https://f-droid.org/en/packages/com.termux/) app installed from F-Droid.
-   `ffmpeg` package installed in Termux.

## Installation & Setup

1.  **Install Termux**: Download and install Termux from the [F-Droid store](https://f-droid.org/en/packages/com.termux/).

2.  **Grant Storage Access**: Open Termux and run the following command to allow it to access your phone's storage.
    ```bash
    termux-setup-storage
    ```
    Accept the permission prompt that appears.

3.  **Install FFmpeg**: This is the core tool for video conversion. Install it by running:
    ```bash
    pkg update && pkg upgrade -y
    pkg install ffmpeg
    ```

## Quick Start: One-Command Download

To download and make the script executable with a single command, run this in Termux:

```bash
curl -L -O https://raw.githubusercontent.com/YOUR_USERNAME/YOUR_REPOSITORY/main/video-converter.sh && chmod +x video-converter.sh
```

**Important**: Replace `YOUR_USERNAME` and `YOUR_REPOSITORY` with your actual GitHub username and repository name.

## Usage

1.  Navigate to the directory where you downloaded the script (or just run it from your home directory).
2.  Execute the script:
    ```bash
    ./video-converter.sh
    ```
3.  Follow the on-screen prompts:
    -   Enter the full path to the folder containing your videos (e.g., `/storage/emulated/0/Download`).
    -   Choose the desired conversion quality (`1` for lowest, `2` for medium).
4.  The script will start converting all videos in that folder.

> ### **⚠️ Disclaimer**
>
> This script is designed to **delete the original video files** after a successful conversion. Please make sure you have a backup of any important videos before running this script. Use it at your own risk.

## License

This project is open-source and available under the [MIT License](LICENSE).
