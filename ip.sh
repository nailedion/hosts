#!/bin/bash

cat /etc/hosts | while read -r linie; do

	if [ "${linie:0:1}" -ge "0" -o "${linie:0:1}" -le "9" ]; then

		ip=$(echo "$linie" | awk '{print $1}')
		adr=$(echo "$linie" | awk '{print $2}')
		ip_lu=$(nslookup "$adr" 8.8.8.8 | grep -m 2 'Address:' | tail -n 1 | awk '{print $2}')

		if [ "$ip_lu" != "$ip" -a "$ip" != "127.0.0.1" ]; then
			if [ "$ip" != "127.0.1.1" ]; then
        			echo "Bogus IP for $adr in /etc/hosts!"
    			fi
		fi

	fi

done
