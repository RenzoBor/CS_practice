#include <stdio.h>
#define MAXLINE = 1000
void main(){
    int c, i;
    char input[1000];
    i = 0;
    
    while ((c = getchar()) != EOF){
        if (c != ' ' && c != '\t')
        {
            input[i] = c;
            i++;
        }
        if (c == '\n'){
            printf("%s\n",input);
        };
        
    }
    
    }