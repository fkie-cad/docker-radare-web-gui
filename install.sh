#!/bin/sh


## Install Required Packages
install_clean \
    build-essential \
    git \
    npm \
    python3-pip \
    python3

## Install Radare
git clone https://github.com/radare/radare2.git
cd radare2
sys/install.sh
cd ..


## Build WebUI
git clone https://github.com/dorpvom/radare2-webui.git
cd radare2-webui
make root

make material
make panel
make enyo
make tiles


## Patch WebUI
mv dist/enyo/r2core.js        ../radare2/shlr/www/enyo/r2core.js
mv dist/enyo/r2app.js         ../radare2/shlr/www/enyo/r2app.js
mv dist/r2.js                 ../radare2/shlr/www/f/r2.js
mv dev/m/disasmNavProvider.js ../radare2/shlr/www/m/disasmNavProvider.js
mv dev/m/disasmProvider.js    ../radare2/shlr/www/m/disasmProvider.js
mv dev/m/hexchunkProvider.js  ../radare2/shlr/www/m/hexchunkProvider.js
mv dev/m/r2.js                ../radare2/shlr/www/m/r2.js
mv dev/p/r2core.js            ../radare2/shlr/www/p/r2core.js
mv dist/t/app.js              ../radare2/shlr/www/t/app.js

cd ..
rm -rf /opt/app/radare2-webui


## Install Server
git clone https://github.com/fkie-cad/fact_radare_viewer.git
pip3 install -r fact_radare_viewer/requirements.txt


## Remove Redundant Packages
apt-get remove -y \
    build-essential \
    git \
    npm \
    python3-pip
apt-get autoremove -y


exit 0
