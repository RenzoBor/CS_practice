min=0
max=100
ans=int((min+max)/2)
answer=''
print("Please think of a number between 0 and 100")
while True:
    print("Is your number "+str(ans)+"?")
    answer=input('Press "l" if its lower, press "h" if it is higher and press "c" if the number is correctly: ')
    if answer == "l":
        max=ans
    elif answer == "h":
        min=ans
    elif answer == "c":
        print("Nice, Your secret number was: "+str(ans))
        break
    else:
        print("I didn't understand that.")
    ans=int((min+max)/2)
        