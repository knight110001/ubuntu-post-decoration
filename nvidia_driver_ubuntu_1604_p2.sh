#!/bin/bash

DRIVER_BIN=NVIDIA-Linux-x86_64-384.90.run

chmod a+x ${DRIVER_BIN}

# CTRL + ALT + F1 -> tty1, stop lightdm by service or systemctl
sudo service lightdm stop

# Only install dirver, but not OpenGL modules, otherwise it will cause the "login loop" or "stuck in login" issue
sudo ./${DRIVER_BIN} --dkms --no-opengl-files

# –-no-opengl-files：表示只安装驱动文件，不安装OpenGL文件。这个参数不可省略，否则会导致登陆界面死循环，英语一般称为”login loop”或者”stuck in login”。
# 必选参数解释：因为NVIDIA的驱动默认会安装OpenGL，而Ubuntu的内核本身也有OpenGL、且与GUI显示息息相关，一旦NVIDIA的驱动覆写了OpenGL，在GUI需要动态链接OpenGL库的时候就引起问题。
# –-no-x-check：表示安装驱动时不检查X服务，非必需，我们已经禁用图形界面。
# –-no-nouveau-check：表示安装驱动时不检查nouveau，非必需，我们已经禁用驱动。
# -Z, –disable-nouveau：禁用nouveau。此参数非必需，因为之前已经手动禁用了nouveau。
# -A：查看更多高级选项。
# --dkms（默认开启）在 kernel 自行更新时将驱动程序安装至模块中，从而阻止驱动程序重新安装。在 kernel 更新期间，dkms 触发驱动程序重编译至新的 kernel 模块堆栈。
# 
# 安装过程中的选项
# dkms 安装最好 选yes
# 32位兼容 安装最好 选yes
# x-org 最好别安，选no，有的电脑可能导致登录界面黑屏

nvidia-smi

# restart desktop
sudo service lightdm start #没自动跳的话 crtl+alt+f7

nvidia-settings #若弹出设置对话框，亦表示驱动安装成功

