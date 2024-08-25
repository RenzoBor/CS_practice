#include <stdio.h>
/*A program that takes an input and prints a word per line*/
void main(){
    int c;
    while((c= getchar()) != EOF){
        
        if(c == ' '){
            putchar('\n');
        } else {
            putchar(c);
        }
    }
}