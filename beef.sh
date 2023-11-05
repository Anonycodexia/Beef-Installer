#!/data/data/com.termux/files/usr/bin/bash

cd $HOME

clear

echo "Dependencies installation..."

rm $PREFIX/etc/apt/sources.list.d/*

pkg install -y binutils python python-pip autoconf bison clang coreutils curl findutils apr apr-util postgresql openssl readline libffi libgmp libpcap libsqlite libgrpc libtool libxml2 libxslt ncurses make ncurses-utils ncurses git wget unzip zip tar termux-tools termux-elf-cleaner pkg-config git ruby -o Dpkg::Options::="--force-confnew"
pkg install -y curl wget libyaml bison espeak nodejs 
python3 -m pip install --upgrade pip
gem install nokogiri -- --use-system-libraries
python3 -m pip install requests

source <(curl -sL https://github.com/termux/termux-packages/files/2912002/fix-ruby-bigdecimal.sh.txt)

cd $PREFIX/opt
git clone https://github.com/beefproject/beef --depth=1

cd $HOME/beef

sed -i 's/sudo//g' $HOME/beef/install

sed -i '274 s/check_os//g' $HOME/beef/install

sed -i '275 s/check_ruby_version//g' $HOME/beef/install

echo "Set the Password"

read -p "Enter the new username: " username

sed -i "20 s/\bbeef\b/$username/g" $HOME/beef/config.yaml

read -p "Enter the new password: " password

sed -i "21 s/\bbeef\b/$password/g" $HOME/beef/config.yaml

echo "Your Username & Password Successfully changed"
bash install

rm -rf $HOME/Beef-Installer

echo "INSTALLATION COMPLETED..."

echo "Please Restart Your Terminal"

echo "Please Subscribe to Youtube Channel Cybereveal"
