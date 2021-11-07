#!/bin/bash

function getInfoFromFile
{
	echo $(cat test1Check.txt)
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
		echo $1
		echo $2
                exit 2
        fi
}

cd ../Scripts

rm -rf TestingDirectory1

mkdir TestingDirectory1
cd TestingDirectory1
touch TestingFile1
mkdir TestingDirectory2
cd TestingDirectory2
touch TestingFile2

ExpectedValue="TestingDirectory1 TestingDirectory1/TestingDirectory2 TestingDirectory1/TestingDirectory2/TestingFile2 TestingDirectory1/TestingFile1"
test1="test1Check.txt"

cd ../..

./Print_All_Files.sh TestingDirectory1 > $test1
answer=$(getInfoFromFile)

check "$answer" "$ExpectedValue" "+ Your script works for Script directory" "- TEST FAILED: ./Print_All_Files.sh TestingDirectory1"

touch FileErrorHandler
./Print_All_Files.sh FileErrorHandler > $test1
answer=$(getInfoFromFile)

check "$answer" "FileErrorHandler is not a directory" "+ Your script sends error when it's file" "- TEST FAILED: ./Print_All_Files.sh FileErrorHandler"

./Print_All_Files.sh > $test1
answer=$(getInfoFromFile)

check "$answer" "Wrong number of arguments" "+ Your script sends error when there is no arguments" "- TEST FAILED: ./Print_All_Files.sh"

./Print_All_Files.sh FileErrorHandler TestingDirectory1 > $test1
answer=$(getInfoFromFile)

check "$answer" "Wrong number of arguments" "+ Your script sends error when there is 2 arguments" "- TEST FAILED: ./Print_All_Files.sh FileErrorHandler TestingDirectory1"

rm -rf TestingDirectory1
rm FileErrorHandler
rm test1Check.txt
