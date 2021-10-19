#!/bin/bash

fileOrDir="$1"

if [ -z $fileOrDir ]; then
	echo "No argument was passed"
	exit 1
fi

if [ -f $fileOrDir ]; then
	echo "$fileOrDir is a file"
elif [ -d $fileOrDir ]; then
	echo "$fileOrDir is a directory"
else
	echo "$fileOrDir not a file nor a directory"
fi
