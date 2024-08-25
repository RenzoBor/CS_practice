#include <stdio.h>
#define MAXSTR = 100
void main(){
    
    int c, i;
    char str[1000];
    i=0;
    while((c=getchar())!= EOF){
         str[i] = c;
         i++;
         if (c == '\n' && i > 80)
         {
            printf("%s %6.0d",str, i);
         }
    };
    
}