# Spotify Autostart

Bu proje, bilgisayarınız açıldığında otomatik olarak Spotify'ı başlatıp rastgele bir şarkı çalmaya başlayan basit bir Python betiğidir. GNOME masaüstü ortamında çalışacak şekilde tasarlanmıştır.

## Özellikler
- Spotify uygulamasını başlatır.
- Belirtilen bir çalma listesinden rastgele bir şarkı çalar.
- Bilgisayar açılışında otomatik olarak çalışır.

## Gereksinimler
- Python 3
- `python-dotenv` kütüphanesi
- GNOME masaüstü ortamı
- Spotify uygulaması

## Kurulum

### Adım 1: Depoyu Klonlayın
```sh
git clone https://github.com/enbiyagoral/spotify-autostart-on-linux.git
cd spotify-autostart-on-linux
```

### Adım 2: Gerekli Python Kütüphanelerini Yükleyin
```sh
pip install python-dotenv
```
### Adım 3: Çevresel Değişkenleri Ayarlayın
.env dosyasını oluşturun ve içine Spotify çalma listesi ID'sini ekleyin. Örneğin:

```sh
SPOTIFY_PLAYLIST_ID=spotify:playlist:37i9dQZF1DX0XUsuxWHRQd
```
Eğer .env dosyasını oluşturmazsanız, betik varsayılan bir çalma listesi kullanacaktır.

### Adım 4: Autostart Dosyasını Oluşturun
setup.sh betiğini kullanarak autostart dosyasını oluşturun ve ayarlayın:

```sh
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
```

Bu betikte, $script_path değişkeni kullanıcının Python betiğinin tam yolunu girmesini sağlar. Bu kısmın doğruluğundan emin olmak için betiğinizin tam yolunu girmeniz gerekmektedir. Örnek bir yol: /home/kullanici/spotify-autostart/play_random_song.py.

### Adım 5: setup.sh Dosyasını Çalıştırma
- setup.sh dosyasını projenizin kök dizinine kaydedin.
- Terminalde, dosyanın bulunduğu dizine gidin.
- Aşağıdaki komutları çalıştırarak dosyayı çalıştırılabilir hale getirin ve çalıştırın:

```sh
chmod +x setup.sh
./setup.sh
```


## Kullanım
Bilgisayarınız yeniden başlatıldığında, Spotify otomatik olarak başlatılacak ve belirtilen çalma listesinden rastgele bir şarkı çalacaktır.

## Katkıda Bulunma
Katkıda bulunmak için lütfen bir pull request gönderin. Her türlü öneri ve iyileştirme için açık olduğumu unutmayın.
