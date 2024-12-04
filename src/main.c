#include <errno.h>
#include <limits.h>
#include <stdio.h>
#include <stdlib.h>

#include "fib.h"
#include "greeter.h"

int main(int argc, char *argv[]) {
  if (argc != 2) {
    fprintf(stderr, "Usage: %s <number>\n", argv[0]);
    return 1;
  }

  errno = 0; // Reset errno before the conversion
  char *endptr;

  long n = strtol(argv[1], &endptr, 10);

  if (endptr == argv[1]) {
    fprintf(stderr, "Error: No digits were found in the input.\n");
    return 1;
  }

  if (errno == ERANGE || n == LONG_MAX || n == LONG_MIN) {
    fprintf(stderr, "Error: Value out of range.\n");
    return 1;
  }

  printf("fib(%ld) = %ld\n", n, fib(n));

  char *greeting = greet("General Kenobi");
  printf("Also: %s\n", greeting);

  free(greeting);
}
