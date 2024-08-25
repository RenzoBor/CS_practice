#include <stdio.h>
#include <string.h>
/*A functin that takes a string and reverse it*/ 
int reverse(char s[]){
    int i;
    i = 0;
    while (s[i] != '\0'){
        i++;
    }
    return i;
};

int main(){
    char s[] = "hijo de la chingada";
    int num;
    num = reverse(s);
    int len;
    printf("%d", num);
    return 0;
}


