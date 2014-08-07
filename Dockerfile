FROM ubuntu:14.04
MAINTAINER Takahiro Yano <speg03@gmail.com>

RUN apt-get update -y && apt-get install -y curl man emacs git tmux zsh openssh-server
RUN curl -s https://get.docker.io/ubuntu/ | sh

RUN useradd -m -s /usr/bin/zsh speg03

ENV HOME /home/speg03
WORKDIR $HOME

RUN mkdir -p .ssh
ADD id_rsa_docker /home/docker/.ssh/id_rsa_docker
ADD id_rsa_docker.pub /home/docker/.ssh/authorized_keys
RUN chown -R speg03:speg03 . && chmod 0700 .ssh && chmod 0600 .ssh/*

RUN echo "speg03  ALL=(ALL) NOPASSWD:ALL" >>/etc/sudoers.d/speg03

RUN service ssh start

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
