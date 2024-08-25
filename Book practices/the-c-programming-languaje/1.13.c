#include <stdio.h>
/*A program that counts the length of the words of an input and
produce an histogram of the lengths of every word*/
void main(){
    int c, i, j, w, count;
    int words[10];
    for (i = 0; i<10; i++){
        words[i] = 0;
    }
    while ((c=getchar()) != EOF || c == '\n'){
        
        if (c != ' '){
            ++count;

        } else {
            ++words[count];
            count = 0;
        }
        }
    
        for ( j = 0; j < 10; j++){
            printf("%d", j);
            printf(": ");
            for(w = 0; w < words[j]; w++){
                printf(" * ");}
            printf("\n");
}
} 
    

