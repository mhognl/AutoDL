#!/bin/bash
if [ ! "`whoami`" = "root" ]
then
	echo "You must run this script as root."
	exit 1
fi
echo "Installing AutoDL now..."
apt update &&
apt full-upgrade -y &&
apt install curl ffmpeg wget acl python python2 python3 -y &&
curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
chmod a+rx /usr/local/bin/youtube-dl
wget https://github.com/mhognl/AutoDL/raw/master/autodl -O /usr/local/bin/autodl
chmod a+rx /usr/local/bin/autodl
mkdir -p /usr/local/src/ytdownloads
touch /usr/local/src/ytdownloads/list.txt
setfacl -R -m u::rwx /usr/local/src/ytdownloads
setfacl -R -m g::rwx /usr/local/src/ytdownloads
setfacl -R -m o::rwx /usr/local/src/ytdownloads
echo "You can add music by applying links from YouTube to /usr/local/src/ytdownloads/list.txt"
echo "Finished!"
echo "Now you can run the command 'autodl' as normal user!"
