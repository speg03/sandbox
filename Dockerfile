FROM ubuntu:14.04
MAINTAINER Takahiro Yano <speg03@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

# Install Packages
ADD ./packages.list /build/
RUN apt-get update
RUN cat /build/packages.list | xargs apt-get install -y --no-install-recommends
RUN rm -rf /var/lib/apt/lists/*

RUN service ssh start
RUN update-locale LANG=ja_JP.UTF-8

EXPOSE 22

ADD ./run.sh /build/
ENTRYPOINT ["/build/run.sh"]
