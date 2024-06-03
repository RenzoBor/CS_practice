def isInTest(s,c):
    """
    input: s: lowerCase string in alphabetical order
            c: character to evaluate
    see if character "c" is in string "s"
    """
    counter=0
    string=s
    middle=string[int(len(string)/2)]
    while len(string)>0:
        if middle == c:
            counter+=1
            print("Char " + c + " found in "+ s +". Took "+str(counter)+" iterations")
            return
        elif middle>c:
            counter+=1
            string=string[0:int(len(string)/2)]
        else:
            print(middle)
            counter+=1
            string=string[int(len(string)/2):-1]
        middle=string[int(len(string)/2)]
    print("Character not found in string" +". Took "+str(counter)+" iterations")
isInTest("abcdefghijklmnopqrstuv","a")



