#!/bin/bash

# 1. download driver, https://www.geforce.cn/drivers, https://www.nvidia.cn/
DRIVER_BIN=NVIDIA-Linux-x86_64-390.48.run

chmod a+x ./${DRIVER_BIN}

# 2. remove old driver
sudo apt-get remove --purge nvidia*

sudo ./${DRIVER_BIN} --uninstall

# 3. setup dependencies
sudo apt-get update
sudo apt-get install -y dkms build-essential linux-headers-generic
sudo apt-get install -y gcc-multilib xorg-dev
sudo apt-get install -y freeglut3-dev libx11-dev libxmu-dev install libxi-dev libgl1-mesa-glx libglu1-mesa libglu1-mesa-dev

# 4. disable noueau
echo -e "blacklist nouveau\nblacklist lbm-nouveau\noptions nouveau modeset=0\nalias nouveau off\nalias lbm-nouveau off" | sudo tee /etc/modprobe.d/blacklist-nouveau.conf
echo options nouveau modeset=0 | sudo tee /etc/modprobe.d/nouveau-kms.conf
sudo update-initramfs -u
sudo reboot #重启

#lsmod | grep nouveau #无显示则成功 当然驱动没了你的桌面分辨率会比较大。
