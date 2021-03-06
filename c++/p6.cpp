#include <iostream>
#include "timer.h"

int main()
{
	Timer::start();
	long int sumSquares = 0, squareSums = 0;

	for (unsigned short i=0; i <= 100; ++i) {
		sumSquares += (i*i);
		squareSums += i;
	}

	std::cout << "The difference is ";
	printf ("%li\n", (squareSums * squareSums) - sumSquares);

	Timer::stop();
}
