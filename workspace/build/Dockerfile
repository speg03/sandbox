FROM archlinux:latest

RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

RUN sed -zi 's@NoExtract  = usr/share/man/\* usr/share/info/\*\n@@' /etc/pacman.conf
RUN pacman -Syu --noconfirm \
        openssh \
        sudo \
        man-db man-pages \
    && rm -f /var/cache/pacman/pkg/*

RUN echo "%wheel ALL=(ALL) NOPASSWD: ALL" >/etc/sudoers.d/wheel_nopasswd

COPY ./run.sh /root/run.sh
RUN chmod +x /root/run.sh

EXPOSE 22
CMD ["/root/run.sh"]
