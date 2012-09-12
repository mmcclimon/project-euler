#include <time.h>

class Timer
{
	public:
		static void startTimer()
		{
			start_time = clock();

		}
		static void stopTimer()
		{
			double elapsed = (double)(clock() - start_time) / CLOCKS_PER_SEC;
			printf( "Finished in %f seconds.\n", elapsed);
		}
	private:
		static int start_time;
};

int Timer::start_time = 0;

