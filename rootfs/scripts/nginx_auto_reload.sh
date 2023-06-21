#!/bin/bash

# setting
checkinterval_min=1

echo "$0 - Start monitoring"

timesleep=$(($checkinterval_min*60))

while true
do
    sleep $timesleep
    if [[ `find /data/nginx /data/nginx/* /data/custom_ssl /data/custom_ssl/* /etc/letsencrypt/live /etc/letsencrypt/live/* -type f ! -name "*.swp" -mmin -1 | wc -l` != 0 ]]
    then
        echo "$0 - Detected Nginx Configuration Change."
        # timetosleep=$(( $RANDOM % 6 + 5 ))
        # echo "$0 - sleep 5 - 10 sec randomly. this time sleep $timetosleep sec..."
        # sleep $timetosleep
        nginx -t
        if [ $? -eq 0 ]
        then
            echo "$0 - Executing: nginx -s reload"
            nginx -s reload
        else
            echo "$0 - found error in config check. skiped the auto reload."
        fi
    fi
done

echo "$0 - monitor stoped"
