#include <iostream>

int main() {
	
	long last = 1, penult = 0;
	long sum = 0;

	while (last < 4000000) {
		long fib = last + penult;
		penult = last;
		last = fib;

		if (last % 2 == 0)
			sum += last;
	}

	std::cout << "Sum of even-valued fibs: " << sum << std::endl;


	return 0;
}
