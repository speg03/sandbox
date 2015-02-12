#!/bin/sh

groupadd -g $GID $USER
useradd -d $SANDBOX_HOME -s $(which zsh) -u $UID -g $GID $USER
echo "$USER  ALL=(ALL) NOPASSWD:ALL" >>/etc/sudoers.d/$USER

### Configuration for Docker
if [ -e /var/run/docker.sock ]; then
    docker_gid=$(stat -c %g /var/run/docker.sock)
    groupadd -g $docker_gid docker
    gpasswd -a $USER docker
fi

### Run sandbox
if [ $# = 0 ]; then
    /usr/sbin/sshd -D
else
    su - $USER -c "$*"
fi
