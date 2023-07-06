#!/bin/bash

cp /var/tmp/db.* /var/dns/
touch /var/dns/ok
echo "PINGA" >> /var/dns/ok


exec "$@"
