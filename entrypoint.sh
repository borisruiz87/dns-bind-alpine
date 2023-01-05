#!/bin/bash

cp /var/tmp/db.* /var/bind/pri
touch /var/bind/pri/ok


exec "$@"
