

# Universal Media Downloader

A versatile command-line tool for downloading media content from various websites including YouTube, Instagram, Twitter, TikTok, and more.

![License](https://img.shields.io/github/license/MusaddekMahadi/universal-media-downloader)
![Issues](https://img.shields.io/github/issues/MusaddekMahadi/universal-media-downloader)
![Stars](https://img.shields.io/github/stars/MusaddekMahadi/universal-media-downloader)

## Features

- **Multi-Platform Support**: Download media from YouTube, Instagram, Twitter, TikTok, Facebook, Vimeo, and more
- **Multiple Format Options**: Save videos in MP4, WebM, or audio in MP3, M4A
- **Quality Selection**: Choose from available quality options for downloads
- **Batch Downloads**: Process multiple URLs at once
- **Playlist Support**: Download entire playlists or channels
- **Subtitle Extraction**: Download and save subtitles when available
- **Cross-Platform**: Works on Windows, macOS, and Linux
- **No Dependencies**: Standalone executable with no external dependencies

## Installation

### Using PyPI (Recommended)

```bash
pip install universal-media-downloader
```

### Using Homebrew (macOS)

```bash
brew install universal-media-downloader
```

### From Source

```bash
git clone https://github.com/MusaddekMahadi/universal-media-downloader.git
cd universal-media-downloader
pip install -r requirements.txt
python setup.py install
```

## Usage

### Basic Usage

Download a video from YouTube:

```bash
umd https://www.youtube.com/watch?v=dQw4w9WgXcQ
```

### Advanced Options

```bash
# Download with specific quality
umd https://www.youtube.com/watch?v=dQw4w9WgXcQ --quality 1080p

# Download as audio only
umd https://www.youtube.com/watch?v=dQw4w9WgXcQ --format mp3

# Download multiple URLs
umd https://youtu.be/dQw4w9WgXcQ https://vimeo.com/123456789

# Download a playlist
umd https://www.youtube.com/playlist?list=PLexample --playlist

# Save to specific directory
umd https://www.youtube.com/watch?v=dQw4w9WgXcQ --output ~/Downloads
```

### Command Line Options

```
usage: umd [-h] [--format FORMAT] [--quality QUALITY] [--output OUTPUT]
           [--playlist] [--subtitle] [--no-progress] [--version]
           [URL ...]

Universal Media Downloader

positional arguments:
  URL                   URL(s) to download from

options:
  -h, --help            show this help message and exit
  --format FORMAT       Output format (mp4, webm, mp3, m4a)
  --quality QUALITY     Video quality (720p, 1080p, 4K, etc.)
  --output OUTPUT       Output directory
  --playlist            Download playlist if available
  --subtitle            Download subtitles if available
  --no-progress         Disable progress bar
  --version             Show program's version number and exit
```

## Supported Sites

- YouTube (Videos, Playlists, Channels)
- Instagram (Posts, Reels, Stories)
- Twitter (Videos, GIFs)
- TikTok (Videos)
- Facebook (Videos)
- Vimeo
- Dailymotion
- Twitch (Clips, VODs)
- Reddit (Videos)
- SoundCloud (Audio)
- Bandcamp (Audio)
- And many more...

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Disclaimer

This tool is for educational purposes only. Please respect the terms of service of the websites you use and ensure you have permission to download content. The developers of this tool are not responsible for any misuse.

## Acknowledgments

- Thanks to all the contributors who have helped improve this project
- Inspired by various open-source media downloaders
- Special thanks to the maintainers of yt-dlp, which serves as a core component for some of the supported sites

## Support

If you find this project useful, please consider giving it a ⭐️ on GitHub!

For issues and questions, please visit our [Issues Page](https://github.com/MusaddekMahadi/universal-media-downloader/issues).
