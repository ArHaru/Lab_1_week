#!/bin/bash

if [ $# != 1 ]; then
        echo "Wrong number of arguments"
        exit 1
fi

number="$1"

if [[ ! "$number" =~ ^-?[0-9]+$  ]]; then
	echo "$number is not a number"
	exit 1
fi

if [ $number == 0 ]; then
	echo -n 0
fi

if [ $number -lt 0 ]; then
	let number*=-1;
	echo -n -
fi

while [ $number -gt 0 ]; do
	dividend=$(($number%10))
	let number=$number/10
	echo -n  "$dividend"
done
