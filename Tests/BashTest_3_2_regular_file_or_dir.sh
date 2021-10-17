#!/bin/bash

cd ../Scripts


./Bash_3_2_regular_file_or_dir.sh ../Tests/testHelper.txt > test2Check.txt
answer1=$(cat test2Check.txt)


./Bash_3_2_regular_file_or_dir.sh ../Tests > test2Check.txt
answer2=$(cat test2Check.txt)

if [ "$answer1" == "is File" ]; then
	echo "Your Script is working for files"
else
	echo "Your Script is NOT working well for files"
fi

if [ "$answer2" == "is Dir" ]; then
	echo "Your Script is working for dirs"
else
	echo "Your Scirpt is NOT working well  for dirs"
fi

rm test2Check.txt
