#include <iostream>
#include "timer.h"

int main() {
	using namespace std;
	Timer::start();
	
	double sum = 0;

	for (int i=0; i < 1000; ++i) {
		if ( i % 3 == 0)
			sum += i;
		else if (i % 5 == 0)
			sum += i;
	}

	cout << "Sum of numbers < 1000 that are multiples of 3 or 5:" << endl;
	cout << sum << endl;
	Timer::stop();
	return 0;
}
