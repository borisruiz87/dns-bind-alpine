#!/bin/bash

if [[ $(ls /var/dns/ | wc -l) == 0 ]]
then
    cp /var/tmp/* /var/dns/
fi

