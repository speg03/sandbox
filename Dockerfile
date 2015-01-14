FROM ubuntu:14.04
MAINTAINER Takahiro Yano <speg03@gmail.com>

ENV DOCKER_VERSION 1.3.3
ENV DEBIAN_FRONTEND noninteractive

ADD . /build

RUN apt-get update
RUN cat /build/packages.list | xargs apt-get install -y --no-install-recommends
RUN rm -rf /var/lib/apt/lists/*
RUN curl -L https://get.docker.io/builds/Linux/x86_64/docker-${DOCKER_VERSION} -o /usr/local/bin/docker && \
    chmod +x /usr/local/bin/docker

RUN service ssh start

VOLUME ["/home"]
EXPOSE 22

CMD ["sh", "/build/run.sh"]
