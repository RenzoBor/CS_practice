#include <stdio.h>
// A function that turn to lowerCase a char. Made without if statement
char lower(char c){
    int val = 'A' - 'a';
    c = (c > 'A' && c < 'Z') ? (c - val) : c ;
    return c; 
}

void main(){
    char c1, c2;
    c1 = lower('k');
    c2 = lower('J');
    printf("%c\n" ,c2);
}