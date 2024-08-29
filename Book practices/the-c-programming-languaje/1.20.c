#include <stdio.h>
const int BLANKSAMOUNT = 4; 
void main(){

    int c;
    
    while ((c = getchar()) != EOF){
        if(c == '\t'){
            int i;
            for( i = 0 ; i < BLANKSAMOUNT; i++){
            putchar(' ');
            }
            } else { putchar(c);}   
    }
}
