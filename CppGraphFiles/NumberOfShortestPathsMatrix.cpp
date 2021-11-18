#include <algorithm>
#include <iostream>
#include <fstream>
#include <vector>
#include <string>
#include <limits>
#include <queue>
#include <list>

typedef std::vector<std::list<std::pair<int, int>>> adjacency_list;

class BigInt;

BigInt integerToBigInt(int n);

struct Coordinate
{
    int x;
    int y;

    Coordinate()
        :
        x(0),
        y(0)
    {
    }

    Coordinate(int x, int y)
        : 
        x(x),
        y(y)
    {
            
    }
};

class BigInt 
{
private:
    std::string number;

    void Normalize()
    {
        std::reverse(number.begin(), number.end());
        while (this->number[number.size() - 1] == '0')
        {
            number.pop_back();
        }
        std::reverse(number.begin(), number.end());

        if (number.size() == 0)
        {
            number = "0";
        }
    }

public:
    BigInt()
        : BigInt("0")
    {
    }

    BigInt(std::string number)
    {
        this->number = number;
    }

    int numDigits()
    {
        return this->number.length();
    }

    bool operator==(BigInt other)
    {
        if (this->number.length() != other.number.length())
            return false;
        for (int i = 0; i < this->number.length(); ++i) 
        {
            if (this->number[i] != other.number[i])
            {
                return false;
            }
        }
        return true;
    }

    bool operator==(const BigInt other) const
    {
        if (this->number.length() != other.number.length())
            return false;
        for (int i = 0; i < this->number.length(); ++i)
        {
            if (this->number[i] != other.number[i])
            {
                return false;
            }
        }
        return true;
    }

    bool operator!=(const BigInt other)
    {
        return !(*this == other);
    }

    bool operator!=(const BigInt other) const
    {
        return !(*this == other);
    }

    bool operator<=(BigInt other)
    {
        if (this->number.length() < other.number.length())
        {
            return true;
        }
        if (this->number.length() > other.number.length())
        {
            return false;
        }
        for (int i = 0; i < this->number.length(); ++i) 
        {
            if (this->number[i] > other.number[i])
            {
                return false;
            }
        }
        return true;
    }

    bool operator<=(const BigInt other) const 
    {
        if (this->number.length() < other.number.length())
        {
            return true;
        }
        if (this->number.length() > other.number.length())
        {
            return false;
        }
        for (int i = 0; i < this->number.length(); ++i)
        {
            if (this->number[i] > other.number[i])
            {
                return false;
            }
        }
        return true;
    }

    bool operator<(BigInt other)
    {
        if (!(*this <= other))
        {
            return false;
        }
        if (*this == other)
        {
            return false;
        }
        return true;
    }

    bool operator<(const BigInt other) const
    {
        if (!(*this <= other))
        {
            return false;
        }
        if (*this == other)
        {
            return false;
        }
        return true;
    }

    bool operator>=(BigInt other)
    {
        if (this->number.length() > other.number.length())
        {
            return true;
        }
        if (this->number.length() < other.number.length())
        {
            return false;
        }

        for (int i = 0; i < this->number.length(); ++i) 
        {
            if (this->number[i] < other.number[i])
            {
                return false;
            }
        }
        return true;
    }

    bool operator>(BigInt other)
    {
        if (!(*this >= other)) return false;
        if (*this == other) return false;
        return true;
    }

    BigInt operator+(BigInt other)
    {
        if (this->number.length() <= other.number.length()) 
        {
            std::reverse(this->number.begin(),
                this->number.end());
            std::reverse(other.number.begin(),
                other.number.end());
            int extraZeroes
                = other.number.length()
                - this->number.length();
            for (int i = 0; i < extraZeroes; ++i) 
            {
                this->number.push_back('0');
            }
        }
        if (this->number.length() > other.number.length()) 
        {
            std::reverse(this->number.begin(),
                this->number.end());
            std::reverse(other.number.begin(),
                other.number.end());
            int extraZeroes
                = this->number.length()
                - other.number.length();
            for (int i = 0; i < extraZeroes; ++i)
            {
                other.number.push_back('0');
            }
        }
        std::string answer = "";
        int carry = 0;
        int ansDigit = 0;
        for (int i = 0; i < this->number.length(); ++i)
        {
            int firstDigit = this->number[i] - '0';
            int secondDigit = other.number[i] - '0';
            int sum = firstDigit + secondDigit + carry;
            ansDigit = sum % 10;
            carry = sum / 10;
            char toPush = ansDigit + '0';
            answer += toPush;
            if (i == this->number.length() - 1 && carry != 0) 
            {
                char extraPush = carry + '0';
                answer += extraPush;
            }
        }
        std::reverse(answer.begin(), answer.end());
        return answer;
    }

    BigInt operator-(BigInt other)
    {
        if (*this == other)
        {
            return BigInt("0");
        }

        std::string str1 = this->number;
        std::string str2 = other.number;

        std::string str = "";

        int n1 = str1.length(), n2 = str2.length();

        reverse(str1.begin(), str1.end());
        reverse(str2.begin(), str2.end());

        int carry = 0;

        for (int i = 0; i < n2; ++i) 
        {
            int sub = ((str1[i] - '0') - (str2[i] - '0') - carry);

            if (sub < 0) 
            {
                sub = sub + 10;
                carry = 1;
            }
            else
                carry = 0;

            str.push_back(sub + '0');
        }

        for (int i = n2; i < n1; ++i) 
        {
            int sub = ((str1[i] - '0') - carry);

            if (sub < 0) 
            {
                sub = sub + 10;
                carry = 1;
            }
            else
                carry = 0;

            str.push_back(sub + '0');
        }

        reverse(str.begin(), str.end());


        BigInt answer(str);
        answer.Normalize();

        return answer;
    }

    BigInt operator*(BigInt other)
    {
        std::vector<BigInt> result;
        std::reverse(other.number.begin(),
            other.number.end());
        for (int i = 0; i < this->number.length(); ++i) 
        {
            int carry = 0;
            int product = 0;
            std::string ans = "";
            int digit = this->number[i] - '0';
            for (int j = 0; j < other.number.length(); ++j) 
            {
                int otherDigit = other.number[j] - '0';
                product = digit * otherDigit + carry;
                carry = product / 10;
                int remainderNumber = carry * 10;
                int number;
                if (remainderNumber != 0)
                    number = product % remainderNumber;
                else
                    number = product % 10;
                char toPush = number + '0';
                ans += toPush;
                if (j == other.number.length() - 1 && carry != 0) 
                {
                    char extraPush = carry + '0';
                    ans += extraPush;
                }
            }
            for (int k = 0; k < this->number.length() - i - 1; ++k) 
            {
                ans = '0' + ans;
            }
            std::reverse(ans.begin(), ans.end());
            BigInt add(ans);
            result.push_back(add);
        }
        BigInt sum("0");
        for (int i = 0; i < result.size(); ++i) 
        {
            sum = sum + result[i];
        }
        return sum;
    }

    friend std::ostream& operator<<(std::ostream& out, const BigInt& bin)
    {
        out << bin.number;
        out << std::endl;
        return out;
    }

    void operator++(int)
    {
        BigInt newNumber(this->number);
        newNumber = newNumber + BigInt("1");
        this->number = newNumber.number;
    }

    void operator++()
    {
        BigInt newNumber(this->number);
        newNumber = newNumber + BigInt("1");
        this->number = newNumber.number;
    }
};

BigInt integerToBigInt(int n)
{
    std::string result = "";
    while (n > 0)
    {
        int digit = n % 10;
        n /= 10;
        char toPush = digit + '0';
        result += toPush;
    }
    std::reverse(result.begin(), result.end());
    BigInt temp(result);
    return temp;
}

int min(int a, int b)
{
    return (a < b) ? a : b;
}

BigInt BinomialCoeff(int n, int k)
{
    std::vector<std::vector<BigInt>> C(n + 1, std::vector<BigInt>(k + 1));
    int i, j;

    for (i = 0; i <= n; ++i)
    {
        for (j = 0; j <= min(i, k); ++j)
        {
            if (j == 0 || j == i)
            {
                C[i][j] = BigInt("1");
            }
            else
            {
                C[i][j] = C[i - 1][j - 1] + C[i - 1][j];
            }
        }
    }
    return C[n][k];
}

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

Coordinate FindCoordinates(int vertex)
{
    int y = vertex % 100;
    int x = vertex / 100;

    return Coordinate(x, y);
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

        Coordinate fromVertexCoord = FindCoordinates(fromVertex);
        Coordinate toVertexCoord = FindCoordinates(toVertex);

        std::ofstream out;

        out.open("../AnswerFiles/AnswerNOSPM.txt");

        if (!out.is_open())
        {
            std::cout << "Coudn't open the file to write the answer" << std::endl;
        }
        else
        {
            int n = std::abs(toVertexCoord.y - fromVertexCoord.y) + std::abs(toVertexCoord.x - fromVertexCoord.x);
            int k = std::abs(toVertexCoord.x - fromVertexCoord.x);
            out << BinomialCoeff(n, k);
        }
        out.close();
    }
}