#!/bin/bash

givenFolder="$1"

for myfile in `find $1`; do
	echo $myfile
done
