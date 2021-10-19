#!/bin/bash
# theme
git clone https://github.com/paullinuxthemer/Mc-OS-themes.git

if test -d $HOME/.themes; then
  WORK_DIR=`$PWD/Mc-OS-themes`
  cd $HOME/.themes
  ln -s -f $WORK_DIR/* .
  cd -
fi

# icons
git clone https://github.com/USBA/Cupertino-iCons.git
git clone https://github.com/USBA/Cupertino-Mobile-iCons.git
git clone https://github.com/USBA/Cupertino-Mojave-iCons.git

if test -d $HOME/.icons; then
  WORK_DIR=`$PWD`
  cd $HOME/.icons
  ln -s -f $WORK_DIR/Cupertino-iCons .
  ln -s -f $WORK_DIR/Cupertino-Mobile-iCons .
  ln -s -f $WORK_DIR/Cupertino-Mojave-iCons .
  cd -
fi


# [utils]
sudo apt-get install -y shutter youdao-dict ibus

# [coding]
sudo apt-get install -y vim-gtk3 emacs exuberant-ctags cscope build-essential

# [cmake]
CMAKE_VERSION=3.20.6
wget -c https://github.com/Kitware/CMake/releases/download/v$CMAKE_VERSION/cmake-$CMAKE_VERSION-linux-x86_64.sh
chmod +x cmake-$CMAKE_VERSION-linux-x86_64.sh
sudo ./cmake-$CMAKE_VERSION-linux-x86_64.sh

# [languages]
# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# golang
VERSION=1.17.2
TARBALL=go${VERSION}.linux-amd64.tar.gz

wget -c https://golang.org/dl/$TARBALL -O - | sudo tar -xz -C /opt/go${VERSION}
sudo ln -s -f /opt/go${VERSION} /opt/go

cat << "EOF" > setup.sh
#!/bin/bash
#export GOPROXY=https://goproxy.io,direct
export GOPROXY=https://goproxy.cn,direct
export GOROOT=/opt/go
export GOPATH=$HOME/.gows
export PATH=$GOROOT/bin:$GOPATH/bin:$PATH
EOF
chmod +x setup.sh
sudo mv setup.sh /opt/go${VERSION}

# [design]
wget -c https://github.com/jgraph/drawio-desktop/releases/download/v15.4.0/drawio-amd64-15.4.0.deb
sudo dpkg -i drawio-amd64-15.4.0.deb

# 1. GIMP: Alternative to Adobe Photoshop
# 2. Inkscape: Alternative to Adobe IIlustrator
# 3. Scribus: Alternative to Adobe Indesign
# 4. OpenShot: Alternative to Adobe Premiere
# 5. Synfig: Alternative to Adobe Animate
# 6. Darktable: Alternative to Adobe Lightroom
# 7. Natron/ButtleOFX: Alternative to Adobe Aftereffects
# 8. Ardour: Alternative to Adobe Audition
# 9. Master PDF: Alternative to Adobe Acrobat
sudo apt-get install -y gimp inkscape scribus openshot synfig darktable ardour

# Foxit Reader
wget -c http://cdn07.foxitsoftware.cn/pub/foxit/reader/desktop/linux/2.x/2.4/en_us/FoxitReader.enu.setup.2.4.4.0911.x64.run.tar.gz
tar -xzf FoxitReader.enu.setup.2.4.4.0911.x64.run.tar.gz
chmod +x FoxitReader.enu.setup.2.4.4.0911*.x64.run
sudo ./FoxitReader.enu.setup.2.4.4.0911*.x64.run

# WPS Office
wget -c https://wdl1.cache.wps.cn/wps/download/ep/Linux2019/10702/wps-office_11.1.0.10702_amd64.deb
sudo dpkg -i wps-office_11.1.0.10702_amd64.deb


