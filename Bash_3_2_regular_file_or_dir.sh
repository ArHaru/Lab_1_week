

#!/bin/bash

read -p "Please give name" fileOrDir

if [ -f $fileOrDir ]; then
	echo "is File"
elif test -d $fileOrDir; then
	echo "is Dir"
else
	echo "neither"
fi

