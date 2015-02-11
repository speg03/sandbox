#!/bin/sh

groupadd -g $GID $USER
useradd -d $SANDBOX_HOME -s $(which zsh) -u $UID -g $GID $USER
echo "$USER  ALL=(ALL) NOPASSWD:ALL" >>/etc/sudoers.d/$USER

if [ $# = 0 ]; then
    /usr/sbin/sshd -D
else
    su - $USER -c "$*"
fi
