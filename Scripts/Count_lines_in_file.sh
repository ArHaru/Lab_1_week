#!/bin/bash

givenFile="$1"

if [ -z $givenFile ]; then
	echo "No argument was passed"
	exit 1
fi

if ! [ -f $givenFile ]; then
	echo "$givenFile is not a file"
	exit 1
fi

wc -l < $givenFile # < is needed so that the file name is not printed in the terminal
