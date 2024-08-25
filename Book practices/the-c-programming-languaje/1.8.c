#include <stdio.h>
/*A program that keeps count of every new line, tab or space*/
void main(){
    int c, count;
    count = 0;
    while((c=getchar()) != EOF){
        if(c == '\n'){
            ++count;
        } else if(c == '\t'){
            ++count;
        } else if(c == ' '){
            ++count;
        };
        printf("%d\n",count);
    }
}