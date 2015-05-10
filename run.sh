#!/bin/sh

: ${SANDBOX_USER:=sandbox}

useradd $SANDBOX_USER
echo "$SANDBOX_USER  ALL=(ALL) NOPASSWD:ALL" >>/etc/sudoers.d/$SANDBOX_USER

if [ $# = 0 ]; then
    ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' -q
    ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N '' -q
    ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -N '' -q
    /usr/sbin/sshd -De
else
    runuser - $SANDBOX_USER -c "$*"
fi
