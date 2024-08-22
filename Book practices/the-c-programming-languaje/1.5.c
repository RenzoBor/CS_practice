#include <stdio.h>
int main(){
    float farenh;
    for(farenh = 300; farenh >= 0; farenh = farenh - 20){
        printf("%3.0f %6.1f\n", farenh, ((5.0/9.0) * (farenh - 32)));
    };
}