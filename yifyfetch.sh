#! /bin/bash

# Automatically get all torrent files from the newsbeuter queue
# and load them into transmission.

echo "#####  YIFY fetcher #####"
date

filelines=`awk '{ print $1 }' < /home/maico/.newsbeuter/queue`
if [[ ${#filelines} == 0 ]]; then
    echo No torrents Found!
else
    for line in $filelines ; do
        echo `basename $line` Added!
        wget -nc -q -P /home/maico/Torrents $line
    done
fi

> /home/maico/.newsbeuter/queue
