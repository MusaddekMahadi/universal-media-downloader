🎵 Universal Media Downloader & Player 🎬

A simple, menu-based Bash script to download or stream audio and video content using [yt-dlp](https://github.com/yt-dlp/yt-dlp) and optionally play in [VLC media player](https://www.videolan.org/vlc/).

🐧 On Debian/Ubuntu:

sudo apt update
sudo apt install yt-dlp vlc -y


📦 Feature:

- 🔽 Download video in selectable resolution (up to 4K)
- 🎧 Download audio in various formats: MP3, OPUS, AAC, FLAC
- 📂 Supports playlist downloading (audio or video)
- ▶️ Stream media directly in VLC without downloading
- 💾 Organized download structure (videos, music, playlists)
- 💡 Color-coded, easy-to-use text UI with number-based menus

🚀 How to Use:

1. Download the Script

curl -O https://raw.githubusercontent.com/MusaddekMahadi/universal-media-downloader/main/universal-media-downloader.sh
chmod +x universal-media-downloader.sh


2. Run the Script

./universal-media-downloader.sh

📁 Default Directory Structure:
Downloaded files are saved in:

~/Downloads/Media Downloader/
├── music/
├── videos/
├── playlists/
└── temp/
You can change the default directory from the "Settings" menu in the script.

🔧 Features in Action:

Download Video: Choose resolution (Best, 4K, 1080p, etc.)

Download Audio: Select format (MP3, OPUS, etc.)

Download Playlist: Download entire playlists in selected format

Play in VLC: Stream any media URL using VLC

Settings: Change default download directory and view current config

📝 License:
This project is licensed under the MIT License. See the LICENSE file for details.

⚙️ Requirements:

- `yt-dlp` (for downloading and URL resolution)
- `vlc` (optional, for playback)
