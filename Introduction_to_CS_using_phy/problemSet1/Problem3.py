# -*- coding: utf-8 -*-
"""
Assume s is a string of lower case characters.

Write a program that prints the longest substring of s in which the letters occur in alphabetical order. For example, if s = 'azcbobobegghakl', then your program should print

Longest substring in alphabetical order is: beggh
In the case of ties, print the first substring. For example, if s = 'abcbcd', then your program should print

Longest substring in alphabetical order is: abc
"""
s = 'azcbobobegghakl'
longestAlphabeticalSubS = ''
alphSubSLength=0
currentSubS=''
currentSubSLen=0

for char in range(len(s)):
    if char == len(s)-1:
        break
    if s[char] <= s[char+1]:
        currentSubS += s[char]
        currentSubSLen += 1
    elif s[char] > s[char+1] and currentSubSLen > alphSubSLength:
        currentSubS += s[char]
        currentSubSLen += 1
        longestAlphabeticalSubS=currentSubS
        alphSubSLength=currentSubSLen
        currentSubSLen=0
        currentSubS=''
    else:
        currentSubSLen=0
        currentSubS=''
print("Longest substring in alphabetical order is: " + longestAlphabeticalSubS)
    
