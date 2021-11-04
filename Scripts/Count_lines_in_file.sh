#!/bin/bash

if [ $# != 1 ]; then
        echo "Wrong number of arguments"
        exit 1
fi

givenFile="$1"

if [ ! -f $givenFile ]; then
	echo "$givenFile is not a file"
	exit 1
fi

wc -l < $givenFile
