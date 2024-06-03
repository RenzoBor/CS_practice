def fibo(m):
    if m==0 or m==1:
        return 1
    else:
        return fibo(m-1)+fibo(m-2)
    
print(fibo(6))