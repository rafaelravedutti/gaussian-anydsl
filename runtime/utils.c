#include <stdio.h>
#include <sys/time.h>

/* Get current time */
double impala_time() {
  struct timeval tp;
  gettimeofday(&tp, NULL);
  return ((double)(tp.tv_sec + tp.tv_usec / 1000000.0));
}
