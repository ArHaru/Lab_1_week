#!/bin/bash

function getInfoFromFile
{
	echo $(cat test4Check.txt)
}

cd ../Scripts

./Count_lines_in_file.sh Count_lines_in_file.sh > test4Check.txt
answer=$(getInfoFromFile)

if [ "$answer" == "15" ]; then
	echo "Count_lines_in_file.sh has 15 lines"
else
	echo -n  "Count_lines_in_file.sh doesn't have "
	echo -n $answer
	echo  " lines"
fi

touch testFile.txt

./Count_lines_in_file.sh testFile.txt > test4Check.txt
answer=$(getInfoFromFile)

if [ "$answer" == "0" ]; then
	echo "tesFile.txt has 0 lines"
else
	echo -n "testFile.txt doesn't have "
	echo -n $answer
	echo " lines"
fi

rm testFile.txt
rm test4Check.txt
