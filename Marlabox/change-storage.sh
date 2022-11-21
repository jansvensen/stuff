sudo nano -w /etc/fstab
# /dev/sda /media/usb/audiofolders ext4 auto,nofail,sync,users,rw 0 0

sudo nano /etc/mpd.conf
# music_directory               "/home/pi/RPi-Jukebox-RFID/shared/audiofolders"
# music_directory                 "/media/usb/audiofolders"

sudo nano /home/pi/RPi-Jukebox-RFID/settings/Audio_Folders_Path
# /home/pi/RPi-Jukebox-RFID/shared/audiofolders
# /media/usb/audiofolders

sudo nano /home/pi/RPi-Jukebox-RFID/settings/global.conf
# AUDIOFOLDERSPATH="/home/pi/RPi-Jukebox-RFID/shared/audiofolders"
# AUDIOFOLDERSPATH="/media/usb/audiofolders"