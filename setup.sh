#!/bin/bash

# Gerekli dizini oluştur
mkdir -p ~/.config/autostart

# Autostart dosyasının yolunu belirle
AUTOSTART_FILE=~/.config/autostart/spotify-autostart.desktop

# Betiğinizin yolunu kullanıcıdan alın
echo "Betiğinizin tam yolunu girin (örnek: /home/kullanici/spotify-autostart/play_random_song.py):"
read script_path

# Autostart dosyasını oluştur ve içeriğini yaz
cat <<EOL > $AUTOSTART_FILE
[Desktop Entry]
Type=Application
Exec=python3 $script_path
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name=Spotify Autostart
Comment=Start Spotify and play a random song on startup
EOL

echo "Autostart dosyası başarıyla oluşturuldu: $AUTOSTART_FILE"
