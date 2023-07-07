#!/bin/bash

cp /var/bind/pri/db.* /var/dns/
touch /var/dns/ok
echo "PINGA" >> /var/dns/ok


exec "$@"
