#include <algorithm>
#include <iostream>
#include <stdlib.h>
#include <fstream>
#include <time.h>
#include <vector>
#include <queue>
#include <set>

int main(int argc, char** argv)
{
	if (argc != 2)
    {
        std::cout << "Invalid number of arguments" << std::endl;
        return 0;
    }

	srand(time(NULL));

	std::string path = "../TestingFiles/TwoVertices.txt";

	std::ofstream out;

	out.open(path);

	if(!out.is_open())
	{
		std::cout << "Coudn't open the file to write the answer" << std::endl;
	}
	else
	{
		int fromVertex, toVertex;

		std::string graphType = argv[1];
		if(graphType == "Matrix")
		{
			fromVertex = rand() % 10000;

			toVertex = rand() % 800 + (fromVertex - 400);
			while(toVertex == fromVertex)
			{
				toVertex = rand() % 800 + (fromVertex - 400);
			}
		}
		else if(graphType == "Circle")
		{
			fromVertex = rand() % 10000;

			toVertex = rand() % 10000;

			while(toVertex == fromVertex)
			{
				toVertex = rand() % 10000;
			}
		}
		out << fromVertex << " " << toVertex;
	}
}