#!/bin/bash

cd ../Scripts

./Bash_3_4_count_lines_in_file.sh Bash_3_1_Print_All_Files.sh > test4Check.txt
answer=$(cat test4Check.txt)

if [ "$answer" == "7" ]; then
	echo "Bash_3_1_Print_All_Files.sh has 7 lines"
else
	echo -n  "Bash_3_1_Print_All_Files.sh doesn't have "
	echo -n $answer
	echo  " lines"
fi

./Bash_3_4_count_lines_in_file.sh ../Tests/testHelper.txt > test4Check.txt
answer=$(cat test4Check.txt)

if [ "$answer" == "1" ]; then
	echo "tesHelper.txt has 0 lines"
else
	echo -n "testHelper.txt doesn't have "
	echo -n $answer
	echo " lines"
fi

rm test4Check.txt
