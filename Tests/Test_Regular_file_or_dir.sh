#!/bin/bash

function getInfoFromFile
{
   echo $(cat test2Check.txt)
}

function getExitCode
{
        echo $(echo $?)
}

cd ../Scripts

touch testFile.txt

./Regular_file_or_dir.sh testFile.txt > test2Check.txt
answer1=$(getInfoFromFile)

mkdir testDirectory

./Regular_file_or_dir.sh testDirectory > test2Check.txt
answer2=$(getInfoFromFile)

if [ "$answer1" == "testFile.txt is a file" ]; then
	echo "+ Your Script is working for files"
else
	echo "- Your Script is NOT working well for files - $answer1"
	exit 2
fi

if [ "$answer2" == "testDirectory is a directory" ]; then
	echo "+ Your Script is working for directories"
else
	echo "- Your Scirpt is NOT working well for directories"
	exit 2
fi

./Regular_file_or_dir.sh wrongDirectory > test2Check.txt
answer=$(getInfoFromFile)

if [ "$answer" == "wrongDirectory not a file nor a directory" ]; then
        echo "+ Script works for passed wrong directories"
else
        echo "- Script doesn't work if wrong directory was passed"
        exit 2
fi

./Regular_file_or_dir.sh > test2Check.txt
checker=$(getExitCode)

if [ $checker == 1 ]; then
        echo "+ Script works in the absence of arguments"
else
        echo "- Script doesn't work if there are no arguments"
        exit 2
fi

./Regular_file_or_dir.sh testDirectory testFile.txt > test2Check.txt
checker=$(getExitCode)

if [ $checker == 1 ]; then
        echo "+ Script works with the wrong number of arguments"
else
        echo "- Script doesn't work with the wrong number of arguments"
        exit 2
fi


rm testFile.txt
rmdir testDirectory
rm test2Check.txt
