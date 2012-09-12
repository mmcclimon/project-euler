#include <iostream>
#include <vector>
#include <math.h>
#include "timer.h"

typedef unsigned int uint;

// returns a vector of prime numbers <= limit
std::vector<int> Sieve(const unsigned int& limit) {
	std::vector<char> sieve (limit, '1');
	std::vector<int> retVector;
	
	// fill it with 0s
	for (uint i=0; i < limit; ++i)
		sieve[i] = 1;

	// after this block, prime indexes all have 1s
	for (uint i=2; i < limit; ++i) {
		if (sieve[i] == 1) {
			for (uint j = i*i; j < limit; j += i)
				sieve[j] = 0;
		}
	}

	for (uint i = 2; i < limit; ++i) {
		if (sieve[i] == 1)
			retVector.push_back(i);
	}

	return retVector;

}

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
