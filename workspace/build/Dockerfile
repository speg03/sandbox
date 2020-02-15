FROM fedora:31

RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

RUN sed -zi 's/tsflags=nodocs\n//' /etc/dnf/dnf.conf
RUN dnf install -y openssh-server && dnf clean all

RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' -q \
    && ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N '' -q \
    && ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -N '' -q

EXPOSE 22
CMD ["/usr/sbin/sshd", "-De"]
