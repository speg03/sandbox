FROM ubuntu:14.04
MAINTAINER Takahiro Yano <speg03@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

ADD . /build

RUN apt-get update -y
RUN cat /build/packages.list | xargs apt-get install -y --no-install-recommends
RUN curl -sSL https://get.docker.io/ubuntu/ | sh

RUN service ssh start

VOLUME ["/home"]
EXPOSE 22

CMD ["sh", "/build/run.sh"]
