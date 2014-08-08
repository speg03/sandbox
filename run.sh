#!/bin/sh

groupadd -g $GID $USER
useradd -s /usr/bin/zsh -u $UID -g $GID $USER
echo "$USER  ALL=(ALL) NOPASSWD:ALL" >>/etc/sudoers.d/$USER

/usr/sbin/sshd -D
