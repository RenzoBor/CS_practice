def merge(L1,L2):
    '''
    first function for merge sort algorithm, this have a linear complexity bc it executes len(L1)+len(L2) times => O(n)
    input: two sorted lists
    output: a sorted list, merge of both inputs
    '''
    result=[]                                    #Initialize my sorted list
    L1Index=0
    L2Index=0
    while L1Index<len(L1) and L2Index<len(L2):   #While there still elements in both lists
        if L1[L1Index]<L2[L2Index]:              # push the higher of the first elements of the lists to the result list
            result.append(L1[L1Index])
            L1Index+=1
        else:
            result.append(L2[L2Index])
            L2Index+=1
    while L1Index < len(L1):                     #If one of the lists is empty. Push the elements of the other list to the result list
        result.append(L1[L1Index])
        L1Index+=1
    while L2Index < len(L2):
        result.append(L2[L2Index])
        L2Index+=1
    return result

def mergeSort(L):
    '''
    The recursive part of the mergeSort. It have a complexity of O(n log n). Bc the recursive part have a logaritmic complexity.
    but it depends on the merge funct. Which is linear, so the complexity is loglinear
      Which is a lot better than bubbleSort or selectionSort
    Input: List of elements
    output: Sorted List
    '''
    if len(L)<2:
        return L[:]                       #If the list have 1 or 0 elements. im Done
    else:
        middle=len(L)//2                  # cut the List in halfs
        left = mergeSort(L[:middle])      # to the same w/ all subsecuent halves
        right= mergeSort(L[middle:])
        return merge(left,right)          #do the merge. All recursive lists will be sorted thanks to recursivity

L=[6,3,55,12,1,25,8,99,65,41,81,2,335,66,2121,111,5,19,20,37,70,92,32,11]
print(mergeSort(L))