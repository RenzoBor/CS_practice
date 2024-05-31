balance=3329
annualInterestRate=0.2
MonthlyInterestRate = annualInterestRate / 12.0
fixedPayment=10
while balance>=0:
    remainingBalance=balance
    for m in range(12):
        remainingBalance = remainingBalance - fixedPayment
        interest= remainingBalance * MonthlyInterestRate
        remainingBalance=remainingBalance + interest
    if remainingBalance <=0:
        break
    fixedPayment+=10
print(str(fixedPayment))
        
