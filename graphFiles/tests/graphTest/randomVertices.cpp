#include <algorithm>
#include <iostream>
#include <stdlib.h>
#include <fstream>

int main(int argc, char** argv)
{
	if (argc != 3)
    {
        std::cout << "Invalid number of arguments" << std::endl;
        return 1;
    }

	srand(time(NULL));

	//std::string path = "../TestingFiles/TwoVertices.txt";

	std::string path = argv[1];

	std::ofstream out;

	out.open(path);

	if(!out.is_open())
	{
		std::cout << "Coudn't open the file to write the answer" << std::endl;
		return 1;
	}
	else
	{
		int fromVertex, toVertex;

		std::string graphType = argv[2];
		if(graphType == "Matrix")
		{
			fromVertex = rand() % 10000;

			toVertex = rand() % 800 + std::abs((fromVertex - 400));
			while(toVertex == fromVertex)
			{
				toVertex = rand() % 800 + std::abs((fromVertex - 400));
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

	out.close();
}