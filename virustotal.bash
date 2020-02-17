#!/bin/bash

if [ "$#" -lt 2 ]; then
	echo "usage: ./virustotal.bash <send|recv> <api-key>"; exit 1
fi

API_KEY=$2
binpath=/home/money/binaries
#logpath=/home/money/
logpath=/home/money/log
logfile=virustotal.json
retirepath=/home/money/.old_binaries

if [ "$1" == 'send' ]; then

	for bin in $(ls -1 $binpath); do
		if ! $(echo $bin | grep -q "\.tmp" ); then
		# Only submit a report for each file with an md5sum name
			./virustotal.py $binpath/$bin $API_KEY
		
		else
			# Remove the binary files with the .tmp extension
			rm $binpath/$bin
		fi
	done

elif [ "$1" == 'recv' ]; then

	for bin in $(ls -1 $binpath); do
		if ! $(echo $bin | grep -q "\.tmp" ); then

			./virustotal.py $binpath/$bin $API_KEY fetch | tr "'" '"' >> $logpath/$logfile 
			
			# Retire the binaries that have been fetched
			#mv $binpath/$bin $retirepath 
		fi
	done
else
	echo "usage: virustotal.bash <send|recv> <api-key>"
fi
