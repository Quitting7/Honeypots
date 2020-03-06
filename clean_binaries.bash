#!/bin/bash

limit=500000

function delete_bins()
{
	binPath=$1
	limit=$2

	binaries=$(ls -1 $binPath)


	for bin in $(ls -1 $binPath); do
		if [ "$(du $binPath | awk '{print $1}')" -lt "$limit" ]; then break; fi
		rm  $binPath/$bin
	done
}

delete_bins ~/binaries $limit
delete_bins ~/.old_binaries $limit
#delete_bins /home/money/Sandbox/cuckoo/storage/binaries $limit
