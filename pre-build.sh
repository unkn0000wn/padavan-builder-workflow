ln -snf /usr/share/zoneinfo/Africa/Nairobi /etc/localtime
apt update
DEBIAN_FRONTEND=noninteractive apt install tzdata -y
date
