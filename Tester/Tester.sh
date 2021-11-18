#!/bin/bash

function getInfoFromFile
{
	echo $(cat $1)
}

function check
{
	if [ "$1" == "$2" ]; then
		echo $3
	else
		echo $4
		echo "Test:"
		echo $1
        echo $2
		exit 2
	fi
}

function removeFile
{
	#rm $1
	if [ -f "$1" ]; then
    	rm $1
	fi
}

function removeAnswerFasp
{
    #rm ../AnswerFiles/AnswerFASP.txt
	removeFile ../AnswerFiles/AnswerFASP.txt
}

function removeAnswerNospc
{
    #rm ../AnswerFiles/AnswerNOSPC.txt
	removeFile ../AnswerFiles/AnswerNOSPC.txt
}

function removeAnswerNospm
{
    #rm ../AnswerFiles/AnswerNOSPM.txt
	removeFile ../AnswerFiles/AnswerNOSPM.txt
}

#test1
cd ..

mkdir AnswerFiles

cd ./CppGraphFiles

count=1

for i in {1..100}
do
	removeAnswerFasp
	removeAnswerNospc

	g++ RandomVertices.cpp

	./a.out Circle

	g++ FindAllShortestPaths.cpp

	./a.out ../TestingFiles/CircleGraph.txt ../TestingFiles/TwoVertices.txt Circle

	g++ NumberOfShortestPathsCircle.cpp

	./a.out ../TestingFiles/TwoVertices.txt

	line=$(head -n 1 ../AnswerFiles/AnswerFASP.txt)
	answerNumberOf=$(getInfoFromFile ../AnswerFiles/AnswerNOSPC.txt)

	echo -n "$count: "
	check "$line" "$answerNumberOf" "+ passed: Circle" "- TEST FAILED: Circle."

	count=$((count+1))
done

count=1

for i in {1..100}
do
	removeAnswerFasp
	removeAnswerNospm

	g++ RandomVertices.cpp

	./a.out Matrix

	g++ FindAllShortestPaths.cpp

	./a.out ../TestingFiles/MatrixGraph.txt ../TestingFiles/TwoVertices.txt Matrix

	g++ NumberOfShortestPathsMatrix.cpp

	./a.out ../TestingFiles/TwoVertices.txt

	lines=$(wc -l < ../AnswerFiles/AnswerFASP.txt)
	answerNumberOf=$(getInfoFromFile ../AnswerFiles/AnswerNOSPM.txt)

	echo -n "$count: "
	check "$lines" "$answerNumberOf" "+ passed: Matrix" "- TEST FAILED: Matrix."

	count=$((count+1))
done

cd ..
rm -rf AnswerFiles