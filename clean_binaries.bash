#!/bin/bash

binPath=$HOME/binaries

limit=500000
binaries=$(ls -1 $binpath)


for bin in $(ls -1 $binPath); do
	if [ "$(du $binPath | awk '{print $1}')" -lt "$limit" ]; then break; fi
	rm  $binPath/$bin
done
