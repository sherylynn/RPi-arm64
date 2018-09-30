#!/bin/bash
#sudo apt update
. $(dirname $0)/../global_definitions

#常用工具
chroot $ROOT_PATH apt install ssh git wget htop ncdu lrzsz vim apt-transport-https -y

#xrdp
#chroot $ROOT_PATH apt install xrdp -y

#安装 xfce4 language-selector-gnome
#gsettings set org.gnome.desktop.input-sources  sources "[('xkb', 'us'),('xkb','es'),('xkb','zh')]"
chroot $ROOT_PATH apt update
chroot $ROOT_PATH apt install xinit -y
#chroot $ROOT_PATH apt install lightdm -y
chroot $ROOT_PATH apt install i3 suckless-tools -y
chroot $ROOT_PATH apt install xfce4-terminal -y

# or 
#sudo apt install lxterminal -y

chroot $ROOT_PATH apt install wicd -y
chroot $ROOT_PATH mkdir -p /home/$1/.i3
chroot $ROOT_PATH cat /etc/i3/config > /home/$1/.i3/config
chroot $ROOT_PATH vi /home/$1/.i3/config -c "normal Gdd" -c ":%s/Mod1/Mod4/g" -c "wq!"
chroot $ROOT_PATH echo "exec --no-startup-id wicd-gtk -t">> /home/$1/.i3/config

chroot $ROOT_PATH echo 'export GTK_IM_MODULE=fcitx' > /home/$1/.xinitrc
chroot $ROOT_PATH echo 'export QT_IM_MODULE=fcitx' >> /home/$1/.xinitrc
chroot $ROOT_PATH echo 'export XMODIFIERS="@im=fcitx"' >> /home/$1/.xinitrc
chroot $ROOT_PATH echo 'exec i3' >> /home/$1/.xinitrc
#改变默认端口
#chroot $ROOT_PATH echo "lxsession -s LXDE -e LXDE" > ~/.xsession
#chroot $ROOT_PATH service xrdp restart
#sudo systemctl isolate graphical.target

#start gui on boot
#chroot $ROOT_PATH systemctl set-default graphical.target
#sudo gnome-language-selector 
