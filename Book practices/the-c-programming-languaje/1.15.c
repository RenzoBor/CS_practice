#include <stdio.h>

int fahrToCelsius(int F){
    int celsius;
    celsius = (5.0 / 9.0) * (F - 32.0);
    return celsius;
}
int main(){
    int conversion;

    conversion = fahrToCelsius(80);
    printf("%d",conversion);
}