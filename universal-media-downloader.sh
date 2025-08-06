#!/bin/bash

# Script name: Universal media downloader & player
# Universal media downloader & player with numbered menu system

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

# Default directories
DOWNLOADS_DIR="${HOME}/Downloads/Media Downloader"
MUSIC_DIR="${DOWNLOADS_DIR}/music"
VIDEOS_DIR="${DOWNLOADS_DIR}/videos"
PLAYLISTS_DIR="${DOWNLOADS_DIR}/playlists"
CONFIG_DIR="${HOME}/.config/ytdl"
TEMP_DIR="${DOWNLOADS_DIR}/temp"

# Create directories
mkdir -p "${DOWNLOADS_DIR}" "${MUSIC_DIR}" "${VIDEOS_DIR}" "${PLAYLISTS_DIR}" "${CONFIG_DIR}" "${TEMP_DIR}"

# Check dependencies
check_dependencies() {
    if ! command -v yt-dlp &> /dev/null; then
        echo -e "${RED}Error: yt-dlp is not installed. Please install it first.${NC}"
        exit 1
    fi

    if ! command -v vlc &> /dev/null; then
        echo -e "${YELLOW}Warning: VLC is not installed. Play option will not work.${NC}"
    fi
}

# Menu functions
show_primary_menu() {
    clear
    echo -e "${CYAN}=== Media Downloader/Player ===${NC}"
    echo -e "1. Download (Default)"
    echo -e "2. Play in VLC"
    read -rp "Choose option (1-2): " primary_choice
    primary_choice=${primary_choice:-1} # Default to 1 if empty
}

show_main_menu() {
    clear
    echo -e "${CYAN}=== Media Options ===${NC}"
    echo -e "1. Download Video"
    echo -e "2. Download Audio"
    echo -e "3. Download Playlist"
    echo -e "4. Settings"
    echo -e "5. Exit"
    read -rp "Choose option (1-5): " choice
}

show_quality_menu() {
    echo -e "\n${YELLOW}Select Quality:${NC}"
    echo "1. Best Quality (Default)"
    echo "2. 4K (if available)"
    echo "3. 1080p"
    echo "4. 720p"
    echo "5. 480p"
    read -rp "Choose quality (1-5): " quality_choice
    
    case $quality_choice in
        1) quality="best" ;;
        2) quality="2160" ;;
        3) quality="1080" ;;
        4) quality="720" ;;
        5) quality="480" ;;
        *) quality="best" ;;
    esac
}

show_audio_format_menu() {
    echo -e "\n${YELLOW}Select Audio Format:${NC}"
    echo "1. MP3 (Default)"
    echo "2. OPUS (Better quality)"
    echo "3. AAC"
    echo "4. FLAC (Lossless)"
    read -rp "Choose format (1-4): " audio_choice
    
    case $audio_choice in
        1) audio_format="mp3" ;;
        2) audio_format="opus" ;;
        3) audio_format="aac" ;;
        4) audio_format="flac" ;;
        *) audio_format="mp3" ;;
    esac
}

# Play function
play_in_vlc() {
    echo -e "\n${BLUE}Enter Media URL:${NC}"
    read -rp "URL: " url
    
    if [ -z "$url" ]; then
        echo -e "${RED}No URL provided!${NC}"
        return
    fi

    echo -e "\n${GREEN}Playing in VLC...${NC}"
    # Stream directly without downloading
    if command -v vlc &> /dev/null; then
        yt-dlp -f "best" -g "$url" | xargs vlc --play-and-exit 2>/dev/null
        echo -e "${GREEN}Playback finished.${NC}"
    else
        echo -e "${RED}VLC is not installed!${NC}"
    fi
}

# Download functions
download_video() {
    show_quality_menu
    echo -e "\n${BLUE}Enter YouTube URL:${NC}"
    read -rp "URL: " url
    
    if [ -z "$url" ]; then
        echo -e "${RED}No URL provided!${NC}"
        return
    fi
    
    echo -e "\n${GREEN}Downloading video (${quality}p)...${NC}"
    yt-dlp -f "bestvideo[height<=?${quality}]+bestaudio/best" \
           --merge-output-format mp4 \
           -o "${VIDEOS_DIR}/%(title)s.%(ext)s" \
           "$url" && echo -e "${GREEN}Download complete!${NC}" || echo -e "${RED}Download failed!${NC}"
}

download_audio() {
    show_audio_format_menu
    echo -e "\n${BLUE}Enter YouTube URL:${NC}"
    read -rp "URL: " url
    
    if [ -z "$url" ]; then
        echo -e "${RED}No URL provided!${NC}"
        return
    fi
    
    echo -e "\n${GREEN}Downloading audio (${audio_format})...${NC}"
    yt-dlp -x --audio-format "$audio_format" \
           -o "${MUSIC_DIR}/%(title)s.%(ext)s" \
           "$url" && echo -e "${GREEN}Download complete!${NC}" || echo -e "${RED}Download failed!${NC}"
}

download_playlist() {
    echo -e "\n${YELLOW}Playlist Options:${NC}"
    echo "1. Download as Videos"
    echo "2. Download as Audio"
    read -rp "Choose option (1-2): " playlist_choice
    
    echo -e "\n${BLUE}Enter Playlist URL:${NC}"
    read -rp "URL: " url
    
    if [ -z "$url" ]; then
        echo -e "${RED}No URL provided!${NC}"
        return
    fi
    
    case $playlist_choice in
        1)
            show_quality_menu
            echo -e "\n${GREEN}Downloading playlist as videos...${NC}"
            yt-dlp -f "bestvideo[height<=?${quality}]+bestaudio/best" \
                   --merge-output-format mp4 \
                   -o "${PLAYLISTS_DIR}/%(playlist_title)s/%(title)s.%(ext)s" \
                   "$url"
            ;;
        2)
            show_audio_format_menu
            echo -e "\n${GREEN}Downloading playlist as audio...${NC}"
            yt-dlp -x --audio-format "$audio_format" \
                   -o "${PLAYLISTS_DIR}/%(playlist_title)s/%(title)s.%(ext)s" \
                   "$url"
            ;;
        *)
            echo -e "${RED}Invalid choice!${NC}"
            return
            ;;
    esac
    
    echo -e "${GREEN}Playlist download complete!${NC}"
}

# Main execution
check_dependencies

while true; do
    show_primary_menu
    
    case $primary_choice in
        1)
            while true; do
                show_main_menu
                
                case $choice in
                    1) download_video ;;
                    2) download_audio ;;
                    3) download_playlist ;;
                    4)
                        echo -e "\n${YELLOW}Settings Menu:${NC}"
                        echo "1. Change Download Directory"
                        echo "2. View Current Settings"
                        echo "3. Back to Main Menu"
                        read -rp "Choose option (1-3): " settings_choice
                        
                        case $settings_choice in
                            1)
                                read -rp "Enter new download directory: " new_dir
                                if [ -d "$new_dir" ]; then
                                    DOWNLOADS_DIR="$new_dir"
                                    echo -e "${GREEN}Download directory updated!${NC}"
                                else
                                    echo -e "${RED}Directory does not exist!${NC}"
                                fi
                                ;;
                            2)
                                echo -e "\n${CYAN}Current Settings:${NC}"
                                echo "Download Directory: $DOWNLOADS_DIR"
                                echo "Video Directory: $VIDEOS_DIR"
                                echo "Audio Directory: $MUSIC_DIR"
                                echo "Playlist Directory: $PLAYLISTS_DIR"
                                ;;
                            3) continue ;;
                            *) echo -e "${RED}Invalid choice!${NC}" ;;
                        esac
                        ;;
                    5) echo -e "${GREEN}Exiting...${NC}"; exit 0 ;;
                    *) echo -e "${RED}Invalid option!${NC}" ;;
                esac
                
                read -rp "Press Enter to continue..."
            done
            ;;
        2) play_in_vlc ;;
        *) echo -e "${RED}Invalid option!${NC}" ;;
    esac
    
    read -rp "Press Enter to continue..."
done
