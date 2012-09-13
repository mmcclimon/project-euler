#include <iostream>
#include <vector>
#include "sieve.h"
#include "timer.h"

const long TARGET = 2000000;
int main()
{
	using namespace std;
	Timer::start();

	vector<int> primes = Sieve(TARGET);
	long sum = 0;

	for (unsigned int i=0; i < primes.size(); ++i)
		sum += primes[i];

	printf("Sum = %li\n", sum);

	Timer::stop();
}
