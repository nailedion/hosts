#!/bin/bash

ip="$1"
ok=1

ip_1=`echo "$ip" | awk -F'.' '{print $1}'`
ip_2=`echo "$ip" | awk -F'.' '{print $2}'`
ip_3=`echo "$ip" | awk -F'.' '{print $3}'`
ip_4=`echo "$ip" | awk -F'.' '{print $4}'`

for i in 1 2 3 4; do
	var="ip_$i"
	val="00${!var}"
	if [ "${val: -3}" -lt "000" -o "${val: -3}" -gt "255" ]; then
		echo "Nu e bun"
		exit 0
	fi
done

echo "Este bun"

