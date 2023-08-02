#include <stdio.h>

int a = 2;
int b = 0;
int c = 0;

c = a != 0 && b/a ? --a * 4 : b++ *2;

printf(a);
printf(b);
printf(c);
