#!/bin/bash

function getInfoFromFile
{
	echo $(cat test3Check.txt)
}

function getExitCode
{
	echo $(echo $?)
}

cd ../Scripts

./Print_reversed_number.sh 1234 > test3Check.txt
answer=$(getInfoFromFile)

if [ "$answer" == "4321" ]; then
	echo "+ For 1234 it works fine"
else
	echo -n "- For 1234 it's not working. Your script printed "
	echo -n $answer
	exit 2
fi

./Print_reversed_number.sh 0 > test3Check.txt
answer=$(getInfoFromFile)

if [ "$answer" == "0" ]; then
	echo "+ For 0 it works fine"
else
	echo -n "- For 0 it's not working. Your script printed "
	echo -n $answer
	exit 2
fi

./Print_reversed_number.sh 3 > test3Check.txt
answer=$(getInfoFromFile)

if [ "$answer" == "3" ]; then
	echo "+ For 3 it work fine"
else
	echo -n "- For 3 it's not working. Your script printed "
	echo -n $answer
	exit 2
fi

./Print_reversed_number.sh -213 > test3Check.txt
answer=$(getInfoFromFile)

if [ "$answer" == "-312" ]; then
        echo "+ For -213 it work fine"
else
        echo -n "- For -213 it's not working. Your script printed "
        echo -n $answer
        exit 2
fi

./Print_reversed_number.sh "hello" > test3Check.txt
checker=$(getExitCode)

if [ $checker == 1 ]; then
        echo "+ Script works when passing the wrong argument (string)"
else
        echo "- Script fails when passed wrong argument (string)"
        exit 2
fi


./Print_reversed_number.sh > test3Check.txt
checker=$(getExitCode)

if [ $checker == 1 ]; then
        echo "+ Script works in the absence of arguments"
else
        echo "- Script doesn't work if there are no arguments"
        exit 2
fi

./Print_reversed_number.sh 2 4 > test3Check.txt
checker=$(getExitCode)

if [ $checker == 1 ]; then
        echo "+ Script works with the wrong number of arguments"
else
        echo "- Script doesn't work with the wrong number of arguments"
        exit 2
fi

rm test3Check.txt
