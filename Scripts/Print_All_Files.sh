#!/bin/bash

givenFolder="$1"

if [ -z "$givenFolder" ]; then
	echo "No argument was passed"
	exit 1
fi

if ! [ -d $givenFolder ]; then
	echo "$givenFolder is not a directory"
	exit 1
fi

for myfile in `find $givenFolder`; do
	echo $myfile
done
