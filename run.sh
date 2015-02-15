#!/bin/sh

: ${SANDBOX_USER:=sandbox}
: ${SANDBOX_UID:=1000}
: ${SANDBOX_GID:=1000}
: ${SANDBOX_HOME:=/home/sandbox}

groupadd -g $SANDBOX_GID $SANDBOX_USER
useradd -M -d $SANDBOX_HOME -s $(which zsh) -u $SANDBOX_UID -g $SANDBOX_GID $SANDBOX_USER
echo "$SANDBOX_USER  ALL=(ALL) NOPASSWD:ALL" >>/etc/sudoers.d/$SANDBOX_USER

### Configuration for Docker
if [ -e /var/run/docker.sock ]; then
    docker_group_name=$(stat -c %G /var/run/docker.sock)
    if [ "$docker_group_name" = "UNKNOWN" ]; then
        docker_group_id=$(stat -c %g /var/run/docker.sock)
        docker_group_name=docker
        groupadd -g $docker_group_id $docker_group_name
    fi
    gpasswd -a $SANDBOX_USER $docker_group_name
fi

### Run sandbox
if [ $# = 0 ]; then
    /usr/sbin/sshd -D
else
    runuser - $SANDBOX_USER -c "$*"
fi
