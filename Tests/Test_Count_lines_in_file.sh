#!/bin/bash

function getInfoFromFile
{
	echo $(cat test4Check.txt)
}

function getExitCode
{
        echo $(echo $?)
}

cd ../Scripts

./Count_lines_in_file.sh Count_lines_in_file.sh > test4Check.txt
answer=$(getInfoFromFile)

if [ "$answer" == "15" ]; then
	echo "+ Count_lines_in_file.sh has 15 lines"
else
	echo -n "- Count_lines_in_file.sh has 15 lines, not "
	echo $answer
	exit 2
fi

touch testFile.txt

./Count_lines_in_file.sh testFile.txt > test4Check.txt
answer=$(getInfoFromFile)

if [ "$answer" == "0" ]; then
	echo "+ testFile.txt has 0 lines"
else
	echo -n "- testFile.txt has 0 lines, not "
	echo $answer
	exit 2
fi

./Count_lines_in_file.sh > test4Check.txt
checker=$(getExitCode)

if [ $checker == 1 ]; then
	echo "+ Script works in the absence of arguments"
else
	echo "- Script doesn't work if there are no arguments"
	exit 2
fi

./Count_lines_in_file.sh Count_lines_in_file.sh testFile.txt > test4Check.txt
checker=$(getExitCode)

if [ $checker == 1 ]; then
        echo "+ Script works with the wrong number of arguments"
else
        echo "- Script doesn't work with the wrong number of arguments"
        exit 2
fi


rm testFile.txt
rm test4Check.txt
