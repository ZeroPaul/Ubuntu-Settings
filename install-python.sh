#!/bin/sh

echo "Install Python3.7.0"

cd ~/
wget https://www.python.org/ftp/python/3.7.0/Python-3.7.0.tgz
tar -xvf Python-3.7.0.tgz
cd ~/Python-3.7.0 && ./configure
make
sudo make install

echo "End install ;D"
