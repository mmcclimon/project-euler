// Find the largest palindrom made from the product of two 3-digit numbers.
#include <iostream>
#include <string>
#include <sstream>

std::string toString(int& i) {
	std::stringstream out;
	out << i;
	return (out.str());
}

int main()
{
	using namespace std;

	int biggest = 0;

	for (int i=100; i < 1000; ++i)
	{
		for (int j=100; j < 1000; ++j)
		{
			int product = i * j;
			if (product < biggest)
				continue;
			
			string forwards = toString(product);
			string backwards = string(forwards.rbegin(), forwards.rend());

			if (forwards[0] == backwards[0] && forwards[1] == backwards[1])
			{
				if (forwards[2] == backwards[2] && product > biggest)
					biggest = product;
			}
		}
	}

	cout << biggest << endl;
}
