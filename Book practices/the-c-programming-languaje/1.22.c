#include <stdio.h>
#include <string.h>
void main(){
    const int COLUMN = 15;
    int c, i, charCount = 0, columnCount = 0;
    char word[100];
    word[0] = '\0';
    while((c=getchar()) != '\n'){

        word[charCount] = c;
        word[charCount + 1] = '\0';
        charCount++;
        printf("%s\n",word);

    }
}