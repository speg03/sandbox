FROM archlinux:latest

RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

RUN pacman -Syu --noconfirm \
        squid \
    && rm -f /var/cache/pacman/pkg/*

COPY ./run.sh /root/run.sh
RUN chmod +x /root/run.sh

EXPOSE 3128
CMD ["/root/run.sh"]
