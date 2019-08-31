#!/bin/sh

echo "Install Python3.6.9"

cd ~/
wget https://www.python.org/ftp/python/3.6.9/Python-3.6.9.tgz
tar -xvf Python-3.6.9.tgz
cd ~/Python-3.6.9 && ./configure
make
sudo make install

echo "End install ;D"
