import random
L=[6,7,22,1,5,69,12,89,33]
def bogoSort():
    '''
    The worst sorting algorithm, in worst case it never reachs the solution => O(inf)
    output: number of iterations, sorted List
    '''
    state=False
    count=0
    while True:
        random.shuffle(L)           #Shuffle the list
        count+=1
        for i in range(1,len(L)):   #Is it sorted?
            if L[i-1]<L[i]:
                state=True
            else:
                state=False
                break               #No, so shuffle it again
        if state==True:             #Yes, we can stop
            print(count)
            return L
print(bogoSort())