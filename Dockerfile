FROM fedora:21
MAINTAINER Takahiro Yano <speg03@gmail.com>

# Install Packages
RUN yum update -y && yum clean all
ADD ./packages.list /build/
RUN (cat /build/packages.list | xargs yum install -y) && yum clean all

EXPOSE 22

ADD ./run.sh /build/
ENTRYPOINT ["/build/run.sh"]
