#!/bin/sh

set -ex

rm -f /var/run/squid.pid
sleep 5 && /usr/sbin/squid -k rotate &

/usr/sbin/squid -NYCd 1
