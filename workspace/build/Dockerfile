FROM archlinux:latest

RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

RUN sed -zi 's@NoExtract  = usr/share/man/\* usr/share/info/\*\n@@' /etc/pacman.conf
RUN pacman -Syu --noconfirm \
        openssh \
    && rm -f /var/cache/pacman/pkg/*

COPY ./run.sh /root/run.sh
RUN chmod +x /root/run.sh

EXPOSE 22
CMD ["/root/run.sh"]
