#!/bin/bash

if [ $# != 1 ]; then
        echo "Wrong number of arguments"
        exit 1
fi

fileOrDir="$1"

if [ -f $fileOrDir ]; then
	echo "$fileOrDir is a file"
elif [ -d $fileOrDir ]; then
	echo "$fileOrDir is a directory"
else
	echo "$fileOrDir not a file nor a directory"
fi
