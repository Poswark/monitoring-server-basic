#!/usr/bin/env bash
ARCHIVO=/laboratorio/git/monitoring-server-basic/data
z=$(cat ${ARCHIVO}/fs90.txt|awk '{print $1" "$6"  "$7}'|grep -i 9|sed "s/% //g")
while read -r z
do
   var=$var$(awk '{print "fs_all{host=\""$1"\", num=\""$2"\", fs=\""$3"\"}", $2z}');
done <<< "$z"

curl -X POST -H  "Content-Type: text/plain" --data "$var
" http://localhost:9091/metrics/job/top/instance/machine
