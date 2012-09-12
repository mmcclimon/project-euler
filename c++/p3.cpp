#include <iostream>
#include <math.h>
#include "timer.h"

const long long TARGET = 600851475143LL;

int main() {
	using namespace std;
	Timer::start();
	
	double root = sqrt(TARGET);
	const unsigned int LIMIT = (int) root;
	char sieve[LIMIT];
	

	// fill the sieve with 1s
	for (unsigned int i=0; i < LIMIT; ++i)
		sieve[i] = 1;


	// after this loop, prime indexes have 1s
	for (unsigned int i = 2; i < LIMIT; ++i) {
		if (sieve[i] == 1) {
			for (unsigned int j = i*i; j < LIMIT; j += i)
				sieve[j] = 0;	
		}
	}

	long long composite = TARGET;
	unsigned int largestPrime = 0;


	for (unsigned int i = 2; i < LIMIT; ++i) {
		if (sieve[i] == 1) {
			if (composite % i == 0) {
				largestPrime = i;
				composite /= i;
				--i;  			// check this factor again
			}
		}
	}

	std::cout << "\nLargest prime: " << largestPrime << "\n";

	Timer::stop();
	return 0;
}
