def selectionSort(L):
    '''
        Sorting algorithm where the take the first element of a list and compare it with the rest of elements and swap them if any of them are lesser,
    if i'm done comparing, that element isn't compared anymore
    It have to iterate (len(L))^2 times => O(n^2). May be a bit more efficient than bubbleSort()
    '''
    suffix=0
    while suffix != len(L):                      #this executes len(L) times
        for i in range(suffix, len(L)):
            if L[suffix]>L[i]:                   #comparing w/ every other element
                L[suffix], L[i]=L[i], L[suffix]  #take the lesser of those two and swap them if true
        suffix+=1
    return L

print(selectionSort([9,2,11,4,20,17,5,33,30,9]))