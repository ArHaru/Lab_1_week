#!/bin/bash

function getInfoFromFile
{
   echo $(cat test2Check.txt)
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

touch testFile.txt

./Regular_file_or_dir.sh testFile.txt > test2Check.txt
answer1=$(getInfoFromFile)

mkdir testDirectory

./Regular_file_or_dir.sh testDirectory > test2Check.txt
answer2=$(getInfoFromFile)

check "$answer1" "testFile.txt is a file" "+ Your Script is working for files" "- Your Script is NOT working well for files - $answer1"

check "$answer2" "testDirectory is a directory" "+ Your Script is working for directories" "- Your Scirpt is NOT working well for directories"

./Regular_file_or_dir.sh wrongDirectory > test2Check.txt
answer=$(getInfoFromFile)

check "$answer" "wrongDirectory not a file nor a directory" "+ Script works for passed wrong directories" "- Script doesn't work if wrong directory was passed"

./Regular_file_or_dir.sh > test2Check.txt
checker=$(getExitCode)

check "$checker" "1" "+ Script works in the absence of arguments" "- Script doesn't work if there are no arguments"

./Regular_file_or_dir.sh testDirectory testFile.txt > test2Check.txt
checker=$(getExitCode)

check "$checker" "1" "+ Script works with the wrong number of arguments" "- Script doesn't work with the wrong number of arguments"


rm testFile.txt
rmdir testDirectory
rm test2Check.txt
