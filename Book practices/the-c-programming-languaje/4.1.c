#include <stdio.h>
/* A function that recieve 2 strings and produce
the index of the rightmost occurrence of t in s*/
int strrindex(char* s,char* t){
int index, i,j;
index = -1;
for(i = 0 ; s[i] != '\0' ; i++){

    for(j = 0; ; j++){
        if (s[i+j] == t[j] && t[j+1] == '\0'){
            index = i;
            break;
        } else if(s[i+j] == t[j]){
            continue;
        } else break;
    }
}
return index;
}

int main(){
    char str1[] = "the most aumos tsoo";
    char str2[] = "o";
    printf("%d\n", strrindex(str1, str2));
}