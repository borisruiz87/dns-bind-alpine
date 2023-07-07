#!/bin/bash

if [[ $(ls /var/dns/ | wc -l) == 0 ]]
then
    cp /var/bind/pri/db.* /var/dns/
fi

exit 0

