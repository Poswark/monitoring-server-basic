ARCHIVO=/laboratorio/git/monitoring-server-basic/data

> ${ARCHIVO}/uptime.txt
for i in $(<${ARCHIVO}/IP_poswark.inventary)
do
echo "$i"
X=`ssh $i -o ConnectTimeout=4 'hostname'`
Y=`ssh $i -o ConnectTimeout=4 uptime|awk  '{print $3}' `
echo "$X $Y"  >> ${ARCHIVO}/uptime.txt

done

