#include <stdio.h>
/*A function that deletes each character in s1 that
matches any character in the string s2*/
char* squeeze(char* s1,char* s2){
    int i, j, w = 0, status;
    enum shouldBeDeleted {NO, YES};
// i goes trough s1, j trough s2, and w controls what chars should be deleted
    for(i=0; s1[i] != '\0'; i++){
        status = NO;
        for(j=0; s2[j] != '\0'; j++){
            if(s1[i] == s2[j]){
                status = YES;
            }
        }
        s1[w] = s1[i];    
        if (status == NO){
            w++;
        }
    }
    s1[w] = '\0';
    return s1;
}
void main(){
    char str1[] = "abcde";
    char str2[] = "bd";
    printf("%s\n", squeeze(str1,str2));
}