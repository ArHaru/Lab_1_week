#!/bin/bash

function getInfoFromFile
{
   echo $(cat test2Check.txt)
}

cd ../Scripts

touch testFile.txt

./Regular_file_or_dir.sh testFile.txt > test2Check.txt
#answer1=$(cat test2Check.txt)
answer1=$(getInfoFromFile)

mkdir testDirectory

./Regular_file_or_dir.sh testDirectory > test2Check.txt
#answer2=$(cat test2Check.txt)
answer2=$(getInfoFromFile)

if [ "$answer1" == "testFile.txt is a file" ]; then
	echo "Your Script is working for files"
else
	echo "Your Script is NOT working well for files - $answer1"
fi

if [ "$answer2" == "testDirectory is a directory" ]; then
	echo "Your Script is working for directories"
else
	echo "Your Scirpt is NOT working well for directories"
fi

rm testFile.txt
rmdir testDirectory
rm test2Check.txt
