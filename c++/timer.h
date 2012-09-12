#include <time.h>

class Timer
{
	public:
		static void start()
		{
			start_time = clock();

		}
		static void stop()
		{
			double elapsed = (double)(clock() - start_time) / CLOCKS_PER_SEC;
			printf( "Finished in %f seconds.\n", elapsed);
		}
	private:
		static int start_time;
};

int Timer::start_time = 0;

