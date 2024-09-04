#include <stdio.h>
#include <string.h>
void main(){
    
    const int COLUMN = 20;
    int c, i, charCount = 0, columnCount = 0;
    char word[100];
    word[0] = '\0';
    while((c=getchar()) != EOF ){
        word[charCount] = c;
        word[charCount + 1] = '\0';
        charCount++;
        columnCount++;
        if (columnCount == COLUMN){
            printf("\n");
            columnCount = 0;
        }
        if(c == ' ' || c == '\n'){
            printf("%s", word);
            charCount = 0;

        };
        if(strlen(word) == COLUMN - 1){
            printf("%s", word);
            printf("-\n");
            columnCount = 0;
            charCount = 0;
            word[0] = '\0';
        } 

    }
}