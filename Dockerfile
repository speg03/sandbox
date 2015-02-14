FROM fedora:21
MAINTAINER Takahiro Yano <speg03@gmail.com>

# Install Packages
RUN yum update -y
ADD ./packages.list /build/
RUN cat /build/packages.list | xargs yum install -y
RUN yum clean all

EXPOSE 22

ADD ./run.sh /build/
ENTRYPOINT ["/build/run.sh"]
