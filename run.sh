#!/bin/sh

groupadd -g $DOCKER_GID docker
useradd -M -s $(which nologin) -u $DOCKER_UID -g $DOCKER_GID docker

groupadd -g $GID $USER
useradd -d $SANDBOX_HOME -s $(which zsh) -u $UID -g $GID -G $DOCKER_GID $USER
echo "$USER  ALL=(ALL) NOPASSWD:ALL" >>/etc/sudoers.d/$USER

if [ $# = 0 ]; then
    /usr/sbin/sshd -D
else
    su - $USER -c "$*"
fi
