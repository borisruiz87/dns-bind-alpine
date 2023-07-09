#!/bin/bash

echo "Comprobando el nombre del script"
echo $0

if [[ $(ls /var/dns/ | wc -l) == 0 ]]
then
    cp /var/tmp/* /var/dns/
    echo "TMP tiene:"
    echo $(ls -lah /var/tmp/) 
fi

echo "Comprobando ultimo ejecutado script"
echo $?
echo "Completado script"

