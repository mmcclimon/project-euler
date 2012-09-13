// Find the only Pythagorean triple, {a, b, c}, for which a + b + c = 1000.
#include <iostream>
#include <math.h>
#include "timer.h"

// Euler's formula: a = m^2 - n^2, b = 2mn, c = m^2 + n^2 
// so calculating m^2 + mn = 500 will find them.

int main()
{
	using namespace std;
	Timer::start();

	int a, b, c;

	for (int m = sqrt(500); m > 0; --m)
	{
		for (int n = 1; n < m; ++n)
		{
			int prod = (m*m + m*n);
			if (prod > 500)
				continue;
			if (prod == 500) {
				a = m*m - n*n;
				b = 2 * m * n;
				c = m*m + n*n;
				break;
			}
		}
	}

	cout << "Pythagorean triple: " << a << ", " << b << ", " << c << endl;
	cout << "Sum = " << a + b + c << endl;
	cout << "Product = " << a * b * c << endl;


	Timer::stop();
}
