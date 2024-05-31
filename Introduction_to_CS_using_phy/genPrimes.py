def genPrimes():
    '''
    gives you a prime number every time you call the .__next__() function on it
    '''
    #Initialize the array of primes, and the number that is being evaluated
    primes=[]
    number=2
    state=True
    while True:
        for p in primes:
            if state==True and (number % p) == 0:
                state=False
        if state==True:
            yield number
            primes.append(number)
            number+=1
        else:
            number+=1
            state=True
primes=genPrimes()
print(primes.__next__())
print(primes.__next__())
print(primes.__next__())
print(primes.__next__())
print(primes.__next__())
print(primes.__next__())
print(primes.__next__())
print(primes.__next__())
print(primes.__next__())
print(primes.__next__())
print(primes.__next__())
