#!/usr/bin/env bash

set -ex

USERNAME=arch
HOSTNAME=workspace

useradd -G wheel ${USERNAME} || true
if [[ ! -e /home/${USERNAME} ]]; then
    mkdir -m 0700 /home/${USERNAME}
    mkdir -m 0700 /home/${USERNAME}/.ssh
    ssh-keygen -t ed25519 -C "${USERNAME}@${HOSTNAME}" -N "" -f /home/${USERNAME}/.ssh/sandbox_${HOSTNAME}
    cp /home/${USERNAME}/.ssh/sandbox_${HOSTNAME}.pub /home/${USERNAME}/.ssh/authorized_keys
    chown -R ${USERNAME}:${USERNAME} /home/${USERNAME}
fi

/usr/sbin/ssh-keygen -A
/usr/sbin/sshd -De
