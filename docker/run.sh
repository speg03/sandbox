#!/bin/sh

: ${SANDBOX_USER:=sandbox}
: ${SANDBOX_UID:=1000}
: ${SANDBOX_GID:=1000}

groupadd -g $SANDBOX_GID $SANDBOX_USER
useradd -u $SANDBOX_UID -g $SANDBOX_GID $SANDBOX_USER
echo "$SANDBOX_USER  ALL=(ALL) NOPASSWD:ALL" >>/etc/sudoers.d/$SANDBOX_USER

if [ $# = 0 ]; then
    key="/home/$SANDBOX_USER/.ssh/sandbox.pem"
    if [ ! -f $key ]; then
        runuser - $SANDBOX_USER -c "ssh-keygen -f $key -N '' -q"
        runuser - $SANDBOX_USER -c "cat $key.pub >>$(dirname $key)/authorized_keys"
        runuser - $SANDBOX_USER -c "chmod 0600 $(dirname $key)/authorized_keys"
    fi

    ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' -q
    ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N '' -q
    ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -N '' -q
    /usr/sbin/sshd -De
else
    runuser - $SANDBOX_USER -c "$*"
fi
