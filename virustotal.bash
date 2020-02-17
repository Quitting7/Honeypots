#!/bin/bash

if [ "$#" -lt 2 ]; then
	echo "usage: ./virustotal.py <send|recv> <api-key>"; exit 1
fi

API_KEY=$2
binpath=/home/money/binaries
logpath=/home/money/
#logpath=/home/money/log
logfile=virustotal.json

if [ "$1" == 'send' ]; then

	for bin in $(ls -1 $binpath); do
		if ! $(echo $bin | grep -q "\.tmp" ); then
		# Only submit a report for each file with an md5sum name
			./virustotal.py $binpath/$bin $API_KEY
		fi
	done

elif [ "$1" == 'recv' ]; then

	for bin in $(ls -1 $binpath); do
		if ! $(echo $bin | grep -q "\.tmp" ); then

			./virustotal.py $binpath/$bin $API_KEY fetch >> $logpath/$logfile 
		fi
	done
else
	echo "usage: virustotal.py <send|recv> <api-key>"
fi
