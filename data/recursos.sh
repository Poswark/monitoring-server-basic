ARCHIVO=/laboratorio/git/monitoring-server-basic/data
> ${ARCHIVO}/hostcpu.txt
> ${ARCHIVO}/hostmem.txt
> ${ARCHIVO}/fs90.txt
for i in $(<${ARCHIVO}/IP_poswark.inventary)
do
echo "$i"
X=`ssh $i -o ConnectTimeout=4 'hostname'`
Y=`ssh $i -o ConnectTimeout=4  sar -u 1 2 |egrep '(Media|Average)'|awk '{printf "%.0f\n",100-$8}' `
Z=`ssh $i -o ConnectTimeout=4 sar -r 1 2 | grep -i Average | awk '{print $4}' `
F=`ssh $i -o ConnectTimeout=4  'df -hP | grep -v tmpfs | egrep -i "90%|91%|92%|93%|94%|95%|96%|97%|98%|99%|100%" '  `
echo "$X $Y"  >>  ${ARCHIVO}/hostcpu.txt
echo "$X $Z"  >>  ${ARCHIVO}/hostmem.txt
echo "$X $F"   >> ${ARCHIVO}/fs90.txt
done
