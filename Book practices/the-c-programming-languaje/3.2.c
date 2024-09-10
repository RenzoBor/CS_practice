#include <stdio.h>
// A function that takes 2 strings and produce the same string but the
// scape sequences "\t" and "\n" are written literally.
char* escape(char* s, char* t){
    int i, j;
    for (i = 0, j = 0 ; s[i] != '\0'; i++){
        switch(s[i]){
            case '\n':
                t[j++] = '\\';
                t[j++] = 'n';
                break;
            case '\t':
                t[j++] = '\\';
                t[j++] = 't';
                break;
            default:
            t[j++] = s[i];
        }
    } 
    t[j] = '\0';
    return t;
}

int main(){
    char str1[] = "hello \t world\n";
    char str2[100];
    printf("%s\n", escape(str1, str2)); 
    return 0;
}