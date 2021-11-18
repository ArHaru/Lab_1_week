#include <algorithm>
#include <iostream>
#include <fstream>
#include <vector>
#include <string>
#include <limits>
#include <queue>
#include <list>

typedef std::vector<std::list<std::pair<int, int>>> adjacency_list;

bool VertexInRnge(int vertex, int verticesCount)
{
    return vertex >= 0 && vertex < verticesCount;
}

adjacency_list ReadGraph(std::ifstream& in)
{
    int vertices, edges;

    in >> vertices >> edges;

    if (vertices < 0 || edges < 0)
    {
        throw std::logic_error("Wrong value for vertices or edges");
    }

    adjacency_list graph(vertices);

    for (int i = 0; i < edges; ++i)
    {
        int vertex1, vertex2, weight;

        in >> vertex1 >> vertex2 >> weight;

        if (VertexInRnge(vertex1, vertices) && VertexInRnge(vertex2, vertices) && weight >= 0)
        {
            graph[vertex1].push_back(std::make_pair(vertex2, weight));
            graph[vertex2].push_back(std::make_pair(vertex1, weight));
        }
        else
        {
            throw std::logic_error("Wrong edge or wrong weight");
        }
    }

    return graph;
}

int main(int argc, char** argv)
{
    if (argc != 2)
    {
        std::cout << "Invalid number of arguments" << std::endl;
        return 0;
    }

    std::ifstream in;

    std::string pathToFile = argv[1];

    in.open(pathToFile);

    if (!in.is_open())
    {
        std::cout << "Coudn't open the file to read the Source and Destination vertices" << std::endl;
    }
    else
    {
        int fromVertex, toVertex;

        in >> fromVertex >> toVertex;

        if (!VertexInRnge(fromVertex, 10000) || !VertexInRnge(toVertex, 10000))
        {
            std::cout << "Invalid values for fromVertex or toVertex " << fromVertex << " " << toVertex << std::endl;
            return 0;
        }

        in.close();

        std::ofstream out;

        out.open("../AnswerFiles/AnswerNOSPC.txt");

        if (!out.is_open())
        {
            std::cout << "Coudn't open the file to write the answer" << std::endl;
        }
        else
        {
            out << std::min(std::abs(fromVertex - toVertex), std::abs(10000 - std::abs(fromVertex - toVertex))) + 1;
        }
        out.close();
    }
}