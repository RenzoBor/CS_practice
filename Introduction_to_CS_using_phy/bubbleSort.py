def bubbleSort(L):
    '''
    Nice basic sorting algorithm. It have to iterate (L(len))^2 times => O(n^2), not very efficient
    '''
    for i in range(len(L)):
        for j in range(len(L)-1):
            if L[j] > L[j+1]:  # It drags the biggest value to the end in every iteration
                temp=L[j+1]
                L[j+1]=L[j]
                L[j]=temp
    return L

print(bubbleSort([95,32,44,5,69,7,80,12,3,24]))
