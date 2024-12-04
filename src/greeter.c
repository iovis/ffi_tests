#include "greeter.h"

char *greet(char *name) {
  char *string = NULL;

  if (asprintf(&string, "Hello, %s!", name) == -1) {
    return NULL;
  }

  return string;
}
