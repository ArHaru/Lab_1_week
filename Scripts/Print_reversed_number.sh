#!/bin/bash

number="$1"

if [ -z $number ]; then
	echo "No argument was passed"
	exit 1
fi

if ! [[ "$number" =~ ^-?[0-9]+$  ]]; then
	echo "$number is not a number"
	exit 1
fi

if [ $number == 0 ]; then
	echo -n 0
fi

while [ $number -gt 0 ]; do
	dividend=$(($number%10))
	let number=$number/10
	echo -n  "$dividend"
done
