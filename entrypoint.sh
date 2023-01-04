#!/bin/bash

cp /var/bind/pri/* /var/bind/pri
touch /var/bind/pri/ok

named -c /etc/bind/named.conf -4 -f -u named

exec "$@"
