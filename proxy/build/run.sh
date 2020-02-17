#!/usr/bin/env bash

set -ex

rm -f /run/squid.pid
sleep 5 && /usr/sbin/squid -k rotate &

/usr/sbin/squid -NYCd 1
