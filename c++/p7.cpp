#include <iostream>
#include <vector>
#include <time.h>
// returns a vector of prime numbers <= limit
std::vector<int> Sieve(const unsigned int& limit) {

	static std::vector<char> sieve (limit, '1');
	static std::vector<int> retVector;
	static unsigned int lastPrime = 2;
	sieve.resize(limit);
	//std::cout << "in Sieve, lastPrime = " << lastPrime << std::endl;
	
	// fill it with 0s
	for (unsigned int i = (sieve.size() == 0 ) ? 0 : lastPrime;
		   	i < limit; ++i) 
		sieve[i] = 1;

	// after this block, prime indexes all have 1s
	for (unsigned int i = 2; i < limit; ++i)
	{
		if (sieve[i] == 1)
		{
			for (unsigned int j = i*i; j < limit; j += i)
				sieve[j] = 0;
		}
	}

	for (unsigned int i = (retVector.size() == 0) ? 2 : retVector.back() + 1; 
			i < limit; 
			++i) 
	{
		if (sieve[i] == 1)
			retVector.push_back(i);
	}

	lastPrime = retVector.back();
	return retVector;

}

int main()
{
	using namespace std;
	clock_t start = clock();

	vector<int> primes;

	unsigned int inc = 500;
	while (primes.size() < 10001) {
		primes = Sieve(inc);
		inc += 500;
	}

	cout << "10000th prime = " << primes[10000] << endl;

	double elapsed = (double)(clock() - start) / CLOCKS_PER_SEC;
	printf( "Finished in %f seconds\n", elapsed);
}
