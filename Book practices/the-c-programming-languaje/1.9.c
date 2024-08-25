#include <stdio.h>
/* A program that takes an input and if there are a consecutive
space it trims it to only one space*/
void main(){
    int input, prevChar;
    while((input = getchar()) != EOF){

       if(prevChar == ' ' && input == ' '){
            
       } else {putchar(input);}
        prevChar = input;
    }
}