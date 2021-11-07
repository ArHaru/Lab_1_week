#!/bin/bash

function getInfoFromFile
{
	echo $(cat test4Check.txt)
}

function getExitCode
{
        echo $(echo $?)
}

function check
{
	if [ $1 == $2 ]; then
		echo $3
	else
		echo $4
		exit 2
	fi
}

cd ../Scripts

./Count_lines_in_file.sh Count_lines_in_file.sh > test4Check.txt
answer=$(getInfoFromFile)

check "$answer" "15" "+ Count_lines_in_file.sh has 15 lines" "- TEST FAILED: Count_lines_in_file.sh has 15 lines, not $answer"

touch testFile.txt

./Count_lines_in_file.sh testFile.txt > test4Check.txt
answer=$(getInfoFromFile)

check "$answer" "0" "+ testFile.txt has 0 lines" "- TEST FAILED: testFile.txt has 0 lines, not $answer"

./Count_lines_in_file.sh > test4Check.txt
checker=$(getExitCode)

check "$checker" "1" "+ Your script sends error when there is no arguments" "- TEST FAILED: when there is no arguments passed"

./Count_lines_in_file.sh Count_lines_in_file.sh testFile.txt > test4Check.txt
checker=$(getExitCode)

check "$checker" "1" "+ Your script sends error when there is 2 arguments" "- TEST FAILED: when there is 2 arguments passed"

rm testFile.txt
rm test4Check.txt
