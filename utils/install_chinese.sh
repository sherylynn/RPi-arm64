#fuck raspbian and rime
#sudo rm -rf ~/.config/fcitx
#sudo apt install ibus-rime
#sudo apt install fcitx-rime
#!/bin/bash
#sudo apt update
. $(dirname $0)/../global_definitions

#常用工具
chroot $ROOT_PATH apt install fonts-wqy-zenhei ttf-wqy-zenhei fcitx -y

chroot $ROOT_PATH apt install fcitx-rime -y

chroot $ROOT_PATH ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
