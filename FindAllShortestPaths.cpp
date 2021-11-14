#include <algorithm>
#include <iostream>
#include <vector>
#include <limits>
#include <stack>
#include <list>

typedef std::vector<std::list<std::pair<int, int>>> adjacency_list; // std::pair<vertex, weight to that edge>

// this function deletes the vertices that have more length than `ShortestDistance`
void DeleteNotShortestPaths(std::vector<std::vector<std::pair<int, int>>>& Paths, int vertex, int ShortestDistance)
{
    // if vector is not empty and to your vertex path is longer than `ShortestDistance`, them we clear all that vector and start to fill it with `ShortestDistance`
    if (!Paths[vertex].empty() && Paths[vertex].begin()->second > ShortestDistance)
    {
        Paths[vertex].clear();
    }
}

// this Dijkstra is modified an dwill retunr matrix that has information about all shortest paths
std::vector<std::vector<std::pair<int, int>>> ModifiedDijkstra(adjacency_list Graph, int start)
{
    std::vector<int> distance(Graph.size(), std::numeric_limits<int>::max());
    std::vector<char> used(Graph.size(), 'f'); // never use vector of bools

    // std::pair<vertex, distance from start to vertex>. `Parents[vertex]` shows from which verticies we can get to that vertex
    std::vector<std::vector<std::pair<int, int>>> Parents(Graph.size());

    distance[start] = 0;

    for (int i = 0; i < Graph.size(); ++i)
    {
        int vertex = -1;

        for (int j = 0; j < Graph.size(); ++j)
        {
            if (used[j] == 'f' && (vertex == -1 || distance[j] < distance[vertex]))
            {
                vertex = j;
            }
        }

        if (distance[vertex] == std::numeric_limits<int>::max())
        {
            break;
        }

        used[vertex] = 't';

        for (auto neighbor : Graph[vertex])
        {
            int to = neighbor.first;
            int length = neighbor.second;

            if (distance[to] >= distance[vertex] + length)
            {
                distance[to] = distance[vertex] + length;

                DeleteNotShortestPaths(Parents, to, distance[to]);

                Parents[to].push_back(std::make_pair(vertex, distance[to]));
            }
        }
    }

    return Parents;
}

// this function will recover all paths in `answer` using `Parents` matrix
void RecoverPathsHelper(const std::vector<std::vector<std::pair<int, int>>>& Parents, int toVertex, int fromVertex,
    std::vector<std::vector<int>>& answer, std::vector<int> onePath)
{
    // this is modified DFS algorithm which will recover all paths
    std::stack<std::pair<int, int>> stack;

    // pair< vertex in stack , index of element from `Parents[vertex]` >
    stack.push( std::make_pair( fromVertex, 0 ) );

    while (!stack.empty())
    {
        std::pair<int, int> s = stack.top();

        onePath.push_back(s.first);

        // if `s.first` is equal to toVertex then we need to save the answer and go back to see if there is more paths
        if (s.first == toVertex)
        {
            std::vector<int> reversedOnePath(onePath.rbegin(), onePath.rend());
            answer.push_back(reversedOnePath);
        }

        bool s_has_neighbors = false;

        /*
         we get from `Parents[s.first]` next index that we need. For example if `s` is pair<6, 2> then we need to push in stack Parents[6][2] and change
         `s` to pair<6, 3>
        */
        if (s.second < Parents[s.first].size())
        {
            s_has_neighbors = true;
            std::pair<int, int> helper = Parents[s.first][s.second];
            helper.second = 0;
            stack.push(helper);
        }

        if (!s_has_neighbors)
        {
            stack.pop();
            if (stack.empty())
            {
                return;
            }
            s = stack.top();
            ++s.second;
            stack.pop();
            stack.push(s);
            onePath.resize(onePath.size() - 2);
        }
    }
}

std::vector<std::vector<int>> RecoverPaths(const std::vector<std::vector<std::pair<int, int>>>& Parents, int toVertex, int fromVertex)
{
    std::vector<std::vector<int>> answer;
    std::vector<int> onePath;
    RecoverPathsHelper(Parents, toVertex, fromVertex, answer, onePath);

    return answer;
}

adjacency_list ReadGraph()
{
    int vertices, edges;
    std::cin >> vertices >> edges;

    adjacency_list Graph(vertices);

    for (int i = 0; i < edges; ++i)
    {
        int a, b, weight;
        std::cin >> a >> b >> weight;

        Graph[a].push_back(std::make_pair(b, weight));
        Graph[b].push_back(std::make_pair(a, weight));
    }

    return Graph;
}

void PrintGraph(const adjacency_list& Graph)
{
    int index = 0;
    for (auto x : Graph)
    {
        std::cout << index << ": ";
        for (auto y : x)
        {
            std::cout << y.first << "(" << y.second << ")  ";
        }
        std::cout << "\n";
        ++index;
    }
}

int main()
{
    adjacency_list Graph = ReadGraph();

    int fromVertex, toVertex;

    std::cin >> fromVertex >> toVertex;

    std::vector<std::vector<std::pair<int, int>>> NotParsedPaths = ModifiedDijkstra(Graph, fromVertex);

    std::vector<std::vector<int>> Paths = RecoverPaths(NotParsedPaths, fromVertex, toVertex);

    /*
    for (int i = 0; i < Paths.size(); ++i)
    {
        for (int j = 0; j < Paths[i].size(); ++j)
        {
            std::cout << Paths[i][j] << " ";
        }
        std::cout << "\n";
    }
    */


    std::cout << "\n\n\nAll shortest paths:\n";
    for(auto x : Paths)
    {
        for(auto y : x)
        {
            std::cout << y << " ";
        }
        std::cout << "\n";
    }
}