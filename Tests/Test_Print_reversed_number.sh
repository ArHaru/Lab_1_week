#!/bin/bash

function getInfoFromFile
{
	echo $(cat test3Check.txt)
}

function getExitCode
{
	echo $(echo $?)
}

function check
{
        if [ "$1" == "$2" ]; then
                echo $3
        else
                echo $4
                exit 2
        fi
}

cd ../Scripts

./Print_reversed_number.sh 1234 > test3Check.txt
answer=$(getInfoFromFile)

check "$answer" "4321" "+ For 1234 it works fine" "- For 1234 it's not working. Your script printed $answer"

./Print_reversed_number.sh 0 > test3Check.txt
answer=$(getInfoFromFile)

check "$answer" "0" "+ For 0 it works fine" "- For 0 it's not working. Your script printed $answer"

./Print_reversed_number.sh 3 > test3Check.txt
answer=$(getInfoFromFile)

check "$answer" "3" "+ For 3 it work fine" "- For 3 it's not working. Your script printed $answer"

./Print_reversed_number.sh -213 > test3Check.txt
answer=$(getInfoFromFile)

check "$answer" "-312" "+ For -213 it work fine" "- For -213 it's not working. Your script printed $answer"

./Print_reversed_number.sh "hello" > test3Check.txt
checker=$(getExitCode)

check "$checker" "1" "+ Script works when passing the wrong argument (string)" "- Script fails when passed wrong argument (string)"

./Print_reversed_number.sh > test3Check.txt
checker=$(getExitCode)

check "$checker" "1" "+ Script works in the absence of arguments" "- Script doesn't work if there are no arguments"

./Print_reversed_number.sh 2 4 > test3Check.txt
checker=$(getExitCode)

check "$checker" "1" "+ Script works with the wrong number of arguments" "- Script doesn't work with the wrong number of arguments"

rm test3Check.txt
