#include <stdio.h> 
void main(){
    const int BLANKSAMOUNT = 5;
    int c;
    
    while ((c = getchar()) != EOF){
        if(c = '\t'){
            int i;
            for( i = 0 ; i < BLANKSAMOUNT ; i++)
            putchar(' ');
        } else { putchar(c);}   
    }
}