#include <stdio.h>
// A function that recieve a shorthand notation (s1) like a-z
// and produce the expansion abcde...z in s2 
char* expand(char* s1, char* s2){
    char c1, c2;
    int i, j, w;
    j = 0;
    for(i = 0; s1[i] != '\0'&& s1[i+2] != '\0'; i++){
        c1 = s1[i];
        c2 = s1[i+2];
        if (c1 == '-' || c2 == '-') continue;
        if (j!= 0) j++;
        for(w = 0;; j++, w++){
            s2[j] = c1 + w;
            if(s2[j] == c2) break;
        }
    }
    s2[j + 1] = '\0';
    return s2;
}

int main(){
    char str1[] = "a-b-c";
    char str2[100];
    printf("%s\n", expand(str1,str2)); 
    return 0;
}