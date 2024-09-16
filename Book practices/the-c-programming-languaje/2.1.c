#include <stdio.h>
#include <limits.h>
#include <float.h>
void main(){
    printf("Rango de signed char: %d a %d\n", SCHAR_MIN, SCHAR_MAX);
    printf("Rango de unsigned char: 0 a %u\n", UCHAR_MAX);

    printf("Rango de signed short: %d a %d\n", SHRT_MIN, SHRT_MAX);
    printf("Rango de unsigned short: 0 a %u\n", USHRT_MAX);

    printf("Rango de signed int: %d a %d\n", INT_MIN, INT_MAX);
    printf("Rango de unsigned int: 0 a %u\n", UINT_MAX);

    printf("Rango de signed long: %ld a %ld\n", LONG_MIN, LONG_MAX);
    printf("Rango de unsigned long: 0 a %lu\n", ULONG_MAX);

    printf("Rango de float: %e a %e\n", FLT_MIN, FLT_MAX);
    printf("Rango de double: %e a %e\n", DBL_MIN, DBL_MAX);
    printf("Rango de long double: %Le a %Le\n", LDBL_MIN, LDBL_MAX);
}