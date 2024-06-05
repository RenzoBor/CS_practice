# -*- coding: utf-8 -*-
"""
Assume s is a string of lower case characters.

Write a program that prints the number of times the string 'bob' occurs in s. For example, if s = 'azcbobobegghakl', then your program should print

Number of times bob occurs is: 2
"""

s = 'bobazcbobobeggbobobohbobaklbob'
bobCount= 0
for char in range(len(s)):
    try:
        if s[char]=="b" and s[char+1]=="o" and s[char+2]=="b":
            bobCount+=1
    except IndexError:
        break
print("Number of times bob occurs is: " + str(bobCount))