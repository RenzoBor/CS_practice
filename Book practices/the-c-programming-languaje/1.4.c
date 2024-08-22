#include <stdio.h>
int main(){
    /*The same program as 1.3 but from celcius to farenheit*/
    float fahr, celcius;
    int lower, upper, step;

    lower = 0;
    upper = 300;
    step = 20;
    celcius = lower;
    printf("%3s %6s\n" , "C", "F");
    while(celcius <= upper){
        fahr =   (celcius  / (5.0 / 9.0)) + 32;
        printf("%3.0f %6.0f\n", celcius , fahr );
        celcius = celcius + step; 
    }
    return 0;
}