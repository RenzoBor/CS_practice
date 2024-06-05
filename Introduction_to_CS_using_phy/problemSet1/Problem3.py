# -*- coding: utf-8 -*-
"""
Assume s is a string of lower case characters.

Write a program that prints the longest substring of s in which the letters occur in alphabetical order. For example, if s = 'azcbobobegghakl', then your program should print

Longest substring in alphabetical order is: beggh
In the case of ties, print the first substring. For example, if s = 'abcbcd', then your program should print

Longest substring in alphabetical order is: abc
"""
s = 'azcbobobegghiaklabcdefghi'
longestAlphabeticalSubS = ''
alphSubSLength=0
currentSubS=''
currentSubSLen=0
for i in range(len(s)-1):
    if s[i]<=s[i+1]:
        if currentSubSLen==0:
            currentSubS=s[i]
        currentSubS+=s[i+1]
        currentSubSLen+=1
        if currentSubSLen>alphSubSLength:
            alphSubSLength=currentSubSLen
            longestAlphabeticalSubS=currentSubS
    else:
        currentSubSLen=0
        currentSubS=''
if longestAlphabeticalSubS=='':
    longestAlphabeticalSubS=s[0]

print("Longest substring in alphabetical order is: " + longestAlphabeticalSubS)
    
