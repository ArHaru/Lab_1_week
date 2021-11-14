# This code reads a graph and then when it gets 2 vertices, it prints all shortest paths from first vertex to another one

How to use this project:
1) **First you need to write the number of your vertices and then the number of edges.**
Here we create a graph with 5 vertices and 3 edges.
>5 3
2) **After we need to create an edge, to create one you need to write first vertex number and then second vertex number. The third parameter is weigth between that two vertices.**
* Warning: pay atnention that vertices are numbered starting from 0
Here we created an edge between 0 5 vertices with weigth 7
>0 5 7
3) **Now you probably want to see a list of all the short paths between vertex A and vertex B. For that you only need to write the number of that vertices.**
Here we will get all short paths from vertex 3 to  vertex 9
>3 9

## Here is a small example of one graph where we want to get all the short paths from vertex 0 to vertex 6

```
7 10

0 1 3
0 5 1000
1 4 4
1 5 5
4 5 9
4 3 3
5 6 4
3 2 1
3 6 2
2 6 1

0 6
```