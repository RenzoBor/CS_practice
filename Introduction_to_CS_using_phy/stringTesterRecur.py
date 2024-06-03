def isIn(s, c):
    string=s
    middle=s[int(len(string)/2)]
    print(string)

    if middle == c:
        return True
    elif len(string)<=1:
        return False
    elif middle>c:
        return isIn(s[:int(len(string)/2)],c)
    else:
        return isIn(s[int(len(string)/2):],c)
print(isIn("abcdefghijklopqstv","z"))