FROM ubuntu:14.04
MAINTAINER Takahiro Yano <speg03@gmail.com>

RUN apt-get update -y && apt-get install -y curl man emacs git tmux zsh openssh-server
RUN curl -s https://get.docker.io/ubuntu/ | sh

RUN service ssh start

VOLUME ["/home"]
EXPOSE 22

ADD run.sh /root/run.sh
CMD ["sh", "/root/run.sh"]
