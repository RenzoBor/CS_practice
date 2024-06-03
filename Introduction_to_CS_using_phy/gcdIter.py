"""
The greatest common divisor of two positive integers is the largest integer that divides each of them without remainder.
Write an iterative function, gcdIter(a, b), that implements this idea. One easy way to do this is to begin with a test value equal to the smaller of the two input arguments, and iteratively reduce this test value by 1 until you either reach a case where the test divides both a and b without remainder, or you reach 1.
"""
def gcdIter(a, b):
    num=min(a,b)
    while a%num!=0 or b%num!=0:
        num-=1
    return num
print(gcdIter(17,12))