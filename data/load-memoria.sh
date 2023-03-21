#!/usr/bin/env bash
ARCHIVO=/laboratorio/git/monitoring-server-basic/data
z=$(cat ${ARCHIVO}/hostmem.txt)
while read -r z
do
   var=$var$(awk '{print "mem_prdall{host=\""$1"\", mem=\""$2"\"}", $2z}');
done <<< "$z"

curl -X POST -H  "Content-Type: text/plain" --data "$var
" http://localhost:9091/metrics/job/top/instance/machine
