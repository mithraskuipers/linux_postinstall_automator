path_aria2=$(find ./installs -type f -print | grep 'aria2')
path_ytdlp=$(find ./installs -type f -print | grep 'yt-dlp')

mkdir -p ~/.config/yt-dlp
cp ./configs/config ~/.config/yt-dlp/
cp ./configs/config_audio ~/.config/yt-dlp/
cp ./configs/config_comments ~/.config/yt-dlp/

echo 'alias yt="yt-dlp"' >> ~/.bashrc
echo 'alias yta="yt-dlp --config-location ~/.config/yt-dlp/config_audio"' >> ~/.bashrc
echo 'alias ytc="yt-dlp --config-location ~/.config/yt-dlp/config_comments"' >> ~/.bashrc