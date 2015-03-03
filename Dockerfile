FROM fedora:21
MAINTAINER Takahiro Yano <speg03@gmail.com>

# Enable to install package documents
RUN sed -ri 's/^(tsflags=nodocs)$/#\1/g' /etc/yum.conf

# Install Packages
RUN yum update -y && yum clean all
ADD ./packages.list /build/
RUN cat /build/packages.list | grep -v '^#' | grep -v '^$' \
    | xargs yum install -y && yum clean all

# Set timezone to Asia/Tokyo
RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# Configure SSH server
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' \
    && ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N '' \
    && ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -N ''
EXPOSE 22

ADD ./run.sh /build/
ENTRYPOINT ["/build/run.sh"]
