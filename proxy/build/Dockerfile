FROM alpine:latest

RUN apk add --update --no-cache squid tzdata
RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

COPY ./run.sh /root/run.sh
RUN chmod +x /root/run.sh

EXPOSE 3128
CMD ["/root/run.sh"]
