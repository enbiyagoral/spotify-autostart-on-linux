import subprocess
from dotenv import load_dotenv
import time
import os

load_dotenv()

def play_random_song():
    my_playlist = os.getenv('SPOTIFY_PLAYLIST_ID')

    if not my_playlist:
        raise ValueError('SPOTIFY_PLAYLIST_ID çevresel değişkeni bulunamadı.')

    subprocess.Popen(["spotify"])

    time.sleep(5)

    subprocess.Popen([
        "dbus-send",
        "--print-reply",
        "--dest=org.mpris.MediaPlayer2.spotify",
        "/org/mpris/MediaPlayer2",
        "org.mpris.MediaPlayer2.Player.OpenUri",
        "string:{}".format(my_playlist)
    ])


if __name__ == '__main__':
    play_random_song()
