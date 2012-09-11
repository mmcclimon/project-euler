#include <vector>

// returns a vector of prime numbers <= limit
std::vector<int> Sieve(const unsigned int& limit) {
	std::vector<char> sieve (limit, '1');
	std::vector<int> retVector;
	
	// fill it with 0s
	for (unsigned int i=0; i < limit; ++i)
		sieve[i] = 1;

	// after this block, prime indexes all have 1s
	for (unsigned int i=2; i < limit; ++i) {
		if (sieve[i] == 1) {
			for (unsigned int j = i*i; j < limit; j += i)
				sieve[j] = 0;
		}
	}

	for (unsigned int i = 2; i < limit; ++i) {
		if (sieve[i] == 1)
			retVector.push_back(i);
	}

	return retVector;

}
