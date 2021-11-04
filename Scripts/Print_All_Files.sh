#!/bin/bash

if [ $# != 1 ]; then
        echo "Wrong number of arguments"
        exit 1
fi

givenFolder="$1"

if [ ! -d $givenFolder ]; then
	echo "$givenFolder is not a directory"
	exit 1
fi

for myfile in `find $givenFolder`; do
	echo $myfile
done
