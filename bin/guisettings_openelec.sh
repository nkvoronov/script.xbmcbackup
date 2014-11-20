#shell file for openelec to close xbmc, copy guisettings, and relaunch

XBMC_PROFILE=$1
XBMC_PATH=$2

systemctl stop xbmc.service

cp $XBMC_PROFILE/userdata/guisettings.xml.restored $XBMC_PROFILE/userdata/guisettings.xml

#give xbmc time to close all threads
ping localhost -c 3

systemctl start xbmc.service