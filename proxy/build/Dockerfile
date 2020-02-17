FROM fedora:rawhide

RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

RUN dnf install -y squid && dnf clean all

COPY ./run.sh /root/run.sh
RUN chmod +x /root/run.sh

EXPOSE 3128
CMD ["/root/run.sh"]
