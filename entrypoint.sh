#!/bin/bash

if [[ $(ls /var/dns/ | wc -l) == 0 ]]
then
    cp /var/tmp/* /var/dns/
    echo "TMP tiene:"
    echo $(ls -lah /var/tmp/) 
fi

echo "Completado script"
