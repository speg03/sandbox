FROM ubuntu:14.04
MAINTAINER Takahiro Yano <speg03@gmail.com>

ENV DOCKER_VERSION 1.3.3
ENV DEBIAN_FRONTEND noninteractive

ADD ./packages.list /build/

RUN apt-get update
RUN cat /build/packages.list | xargs apt-get install -y --no-install-recommends
RUN rm -rf /var/lib/apt/lists/*
RUN curl -L https://get.docker.io/builds/Linux/x86_64/docker-${DOCKER_VERSION} -o /usr/local/bin/docker && \
    chmod +x /usr/local/bin/docker

RUN service ssh start
RUN update-locale LANG=ja_JP.UTF-8

VOLUME ["/home"]
EXPOSE 22

ADD . /build
CMD ["sh", "/build/run.sh"]
