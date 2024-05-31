x=25
epsilon=0.01
low=0
high=x
ans=(low+high)/2.0
numGuess=0
while abs(ans**3-x)>=epsilon:
    if ans**3 > x:
        high=ans
        numGuess+=1
    else:
        low=ans 
        numGuess+=1
    ans=(low+high)/2.0
    print("Low= "+str(low)+", high= "+str(high)+", ans= "+str(ans))
print("The cubic root of "+str(x)+" is approx "+str(ans))
print("Resolved in: " +str(numGuess)+ " iterations")


