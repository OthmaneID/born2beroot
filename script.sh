#MEMORY USAGE
free -m | awk 'NR==2' | awk '{printf "#Memory Usage : %d/%dMB (%.2f%%)\n", $3, $2 , ($3 * 100)/$2}'
#CPU phisical
nproc | awk '{printf "#CPU phisical : %d\n", $1}'
#Architect
uname -a | awk '{printf "#Architecture : "}NR==1'
#Disk Usage
df -h | awk 'NR=="4"{printf "#Disk Usage: %d/%dGB (%s)\n", $3,$2,$5}'
#vCPU
cat /proc/cpuinfo |grep processor | wc -l | awk '{printf "vCPU : "} $1'
#CPU load
grep 'cpu ' /proc/stat | awk '{printf "CPU load : %.1f%%\n", ($2+$4)*100/($2+$4+$5)}'
#Last Boot
who -b | awk '{print "#Last boot: "$3" "$4}'
#TCP connection
ss -s | grep "estab" | tr -d ',' | awk '{print "#Connections TCP : "$4}'
# to get the connected users (I THINK USE)
who / id -un / w -u
