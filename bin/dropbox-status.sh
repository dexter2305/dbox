#!/bin/sh
STORED="";
while true
do
    if [ -f '/dbox/.dropbox-dist/VERSION' ]; then
        CUR="$(dropbox-cli status)";
        if [ "$STORED" != "$CUR" ]; then
            STORED="$CUR"
            echo $(date)" - ${STORED}"
        fi
    fi
    sleep 5
done
