#!/bin/sh

## Install Required Packages
install_clean \
    build-essential \
    git \
    npm \
    python3 \
    python3-pip

## Install Radare
git clone https://github.com/radare/radare2.git
cd radare2
sys/install.sh
cd ..

## Install Server
git clone -b change-r2-call https://github.com/dorpvom/fact_radare_viewer.git
pip3 install -r fact_radare_viewer/requirements.txt

## Install Python Plugin
pip3 install setuptools wheel
pip3 install r2pipe

## Remove Redundant Packages
apt-get remove -y \
    build-essential \
    git \
    npm \
    python3-pip
apt-get autoremove -y

exit 0
