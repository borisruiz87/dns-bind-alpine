#!/bin/bash

touch /var/bind/pri/ok

named -c /etc/bind/named.conf -4 -f -u named

exec "$@"
