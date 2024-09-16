#include <stdio.h>
#include <string.h>
#define MAXSTR = 100
/* A function that recieve a string reverse it and return it in place*/ 
char* reverse(char s[]){
    static char result[100]; // Static para que la variable se mantenga despues de que la funcion termine
    int j, i;
    i = strlen(s);

    for(j = 0; i > 0 ; i--){
        result[j] = s[i-1];
        j++;
    }
    result[j] = '\0';
    return result;

}
int main(){
    
    char string[] = "Hello world";

    printf("%s\n", reverse(string));

    return 0;
    
}