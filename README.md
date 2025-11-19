# yt-dlp Video Downloader

A simple, high-performance batch script for downloading videos and playlists using yt-dlp with optimal settings.

## Features

- **Auto-update**: Automatically updates yt-dlp before each download
- **Maximum performance**: Uses 32 concurrent fragments and connections for faster downloads
- **Best quality**: Downloads best available video and audio, merged into MP4
- **Metadata embedding**: Automatically embeds thumbnails and metadata
- **Interactive or CLI**: Run with or without command-line arguments

## Requirements

- Windows operating system
- `yt-dlp.exe` (included in project)
- `ffmpeg.exe` (included in project)

## Installation

1. Clone or download this repository
2. Ensure `yt-dlp.exe` and `ffmpeg.exe` are in the project folder
3. Run `download.bat`

## Usage

### Interactive Mode

Double-click `download.bat` or run it from the command prompt:

```batch
download.bat
```

You'll be prompted to enter a video or playlist URL.

### Command-Line Mode

Pass the URL as an argument:

```batch
download.bat "https://www.youtube.com/watch?v=VIDEO_ID"
```

Or for playlists:

```batch
download.bat "https://www.youtube.com/playlist?list=PLAYLIST_ID"
```

## Download Location

All videos are saved to the `downloads` folder (created automatically if it doesn't exist).

## Configuration

The script uses the following yt-dlp options:

- `-f "bv*+ba/b"` - Downloads best video and audio, then merges them
- `--merge-output-format mp4` - Outputs MP4 format
- `--embed-thumbnail` - Embeds video thumbnail
- `--embed-metadata` - Embeds video metadata
- `--concurrent-fragments 32` - Downloads 32 fragments simultaneously
- `-N 32` - Uses 32 concurrent connections

## Troubleshooting

### Download is slow
- Check your internet connection
- Some servers may limit concurrent connections

### Error: "yt-dlp.exe not found"
- Ensure `yt-dlp.exe` is in the same folder as `download.bat`

### Error: "ffmpeg not found"
- Ensure `ffmpeg.exe` is in the same folder as `download.bat`
- ffmpeg is required for merging video and audio streams

## Updating yt-dlp

The script automatically updates yt-dlp before each download. To manually update:

```batch
yt-dlp.exe -U
```

## License

This project is a wrapper script for yt-dlp. Please refer to the [yt-dlp license](https://github.com/yt-dlp/yt-dlp/blob/master/LICENSE) for the underlying tool.

## Credits

- [yt-dlp](https://github.com/yt-dlp/yt-dlp) - The video downloader
- [FFmpeg](https://ffmpeg.org/) - Media processing tool
