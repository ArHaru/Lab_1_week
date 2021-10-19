#!/bin/bash

function getInfoFromFile
{
	echo $(cat test3Check.txt)
}

cd ../Scripts

./Print_reversed_number.sh 1234 > test3Check.txt
answer=$(getInfoFromFile)

if [ "$answer" == "4321" ]; then
	echo "For 1234 it works fine"
else
	echo -n "For 1234 it's not working. Your script printed "
	echo -n $answer
fi

./Print_reversed_number.sh 0 > test3Check.txt
answer=$(getInfoFromFile)

if [ "$answer" == "0" ]; then
	echo "For 0 it works fine"
else
	echo -n "For 0 it's not working. Your script printed "
	echo -n $answer
fi

./Print_reversed_number.sh 3 > test3Check.txt
answer=$(getInfoFromFile)

if [ "$answer" == "3" ]; then
	echo "For 3 it work fine"
else
	echo -n "For 3 it's not working. Your script printed "
	echo -n $answer
fi

rm test3Check.txt
