#!/bin/bash

function getInfoFromFile
{
	echo $(cat test1Check.txt)
}

function getExitCode
{
	echo $(echo $?)
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

if [ "$answer" == "$ExpectedValue" ]; then
	echo "+ Your script works for Script directory"
else
	echo "- TEST FAILED: ./Print_All_Files.sh TestingDirectory1"
	echo $answer
	echo $ExpectedValue
	exit 2
fi

touch FileErrorHandler
./Print_All_Files.sh FileErrorHandler > $test1
answer=$(getInfoFromFile)

if [ "$answer" == "FileErrorHandler is not a directory" ]; then
	echo "+ Your script sends error when it's file"
else
	echo "- TEST FAILED: ./Print_All_Files.sh FileErrorHandler"
	exit 2
fi

./Print_All_Files.sh > $test1
answer=$(getInfoFromFile)

if [ "$answer" == "Wrong number of arguments" ]; then
        echo "+ Your script sends error when there is no arguments"
else
        echo "- TEST FAILED: ./Print_All_Files.sh "
        exit 2
fi

./Print_All_Files.sh FileErrorHandler TestingDirectory1 > $test1
answer=$(getInfoFromFile)

if [ "$answer" == "Wrong number of arguments" ]; then
        echo "+ Your script sends error when there is 2 arguments"
else
        echo "- TEST FAILED: ./Print_All_Files.sh FileErrorHandler TestingDirectory1"
        exit 2
fi

rm -rf TestingDirectory1
rm FileErrorHandler
rm $test1
