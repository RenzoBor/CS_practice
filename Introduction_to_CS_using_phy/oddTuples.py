'''
Write a procedure called oddTuples, which takes a tuple as input, and returns a new tuple as output, where every other element of the input tuple is copied, starting with the first one. So if test is the tuple ('I', 'am', 'a', 'test', 'tuple'), then evaluating oddTuples on this input would return the tuple ('I', 'a', 'tuple').
'''
tup= ('I', 'am', 'a', 'test', 'tuple')
def oddTuples(aTup):
    '''
    aTup: a tuple
    
    returns: tuple, every other element of aTup. 
    '''
    newTup=()
    for e in range(len(aTup)+1):
        if e % 2 == 1:
            newTup= newTup + (aTup[e-1],)
    return newTup
print(oddTuples(tup))