#include <stdio.h>
const int BLANKSAMOUNT = 5; 
void main(){
    int c, count, i;
    count = 0;
    while ((c = getchar()) != EOF){
        if(c == ' '){
            ++count;
            if (count == BLANKSAMOUNT){
                putchar('\t');
                count = 0;
            };
        } else {
            for(i = count; i > 0; i--){
                putchar(' ');
            }
            putchar(c);
            count = 0;
        }
    }  
}