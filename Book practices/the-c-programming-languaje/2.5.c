#include <stdio.h>
// A function that the returns the position first char in common between s1 and s2
int any(char* s1,char* s2){
    int i, j;
    for(i=0; s1[i] != '\0'; i++){
        for(j=0; s2[j]!= '\0'; j++){
            if(s1[i] == s2[j]){
                return i;
            }
        }
    }
    return -1;
}

void main(){
    char s1[] = "abcd"; 
    char s2[] = "ce";
    int result = any(s1, s2);
    printf("%d\n",result);
}