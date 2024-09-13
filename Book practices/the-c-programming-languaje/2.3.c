#include <stdio.h>
// A Function that converts hexadecimal string to integer
// Assumes that is a valid hex number. It can start with 0x or 0X
int htoi(char* s){
    int i, result = 0;
    char c;
    i = 0;
    if(s[0] == 0){ // Check if it starts with 0x
        i += 2;    // Jump to the actual number
    }
    for(; s[i] != '\0' ;i++){
        if (s[i] >= '0' && s[i] <= '9'){
            result = result * 16 + (s[i] - '0');
        } else if (s[i] >= 'a' && s[i] <= 'f'){
            result = result * 16 + 10 + (s[i] - 'a'); 
        }  else if (s[i] >= 'A' && s[i] <= 'F'){
           result = result * 16 + 10 + (s[i] - 'A');  
        }
    }
    return result;
}
void main(){
    char hex1[] = "A12";
    char hex2[] = "0xF";
    printf("%d\n", htoi(hex1));
    printf("%d\n", htoi(hex2));
}