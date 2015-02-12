#!/bin/sh

groupadd -g $GID $USER
useradd -d $SANDBOX_HOME -s $(which zsh) -u $UID -g $GID $USER
echo "$USER  ALL=(ALL) NOPASSWD:ALL" >>/etc/sudoers.d/$USER

### Configuration for Docker
if [ -e /var/run/docker.sock ]; then
    docker_group_name=$(stat -c %G /var/run/docker.sock)
    if [ "$docker_group_name" = "UNKNOWN" ]; then
        docker_group_id=$(stat -c %g /var/run/docker.sock)
        docker_group_name=docker
        groupadd -g $docker_group_id $docker_group_name
    fi
    gpasswd -a $USER $docker_group_name
fi

### Run sandbox
if [ $# = 0 ]; then
    /usr/sbin/sshd -D
else
    su - $USER -c "$*"
fi
