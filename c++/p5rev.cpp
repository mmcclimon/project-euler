#include <iostream>
#include <vector>
#include <math.h>
#include "sieve.h"

typedef unsigned int uint;

int main()
{
	using namespace std;

	uint limit = 20;
	vector<int> primes = Sieve(limit);

	vector<int> factors;

	// find greatest exponent of each prime that's less than the limit
	for (uint i=0; i < primes.size(); ++i) {
		for (uint j=1; j < 10; ++j) {
			if ( pow (primes[i], j) > limit ) {
				factors.push_back( pow (primes[i], j-1));
				break;
			}
		}
	}

	int lcm = 1;
	for (uint i=0; i < factors.size(); ++i)
		lcm *= factors[i];

	cout << "Least common multiple: " << lcm << endl;

}
