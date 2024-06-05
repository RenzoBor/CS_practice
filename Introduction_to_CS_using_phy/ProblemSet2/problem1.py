balance=3329
annualInterestRate=0.2
monthlyPaymentRate=0.04

for m in range(1,13):
    minimumPayment=balance*monthlyPaymentRate
    remainingBalance=balance-minimumPayment
    interest=remainingBalance*(annualInterestRate/12)
    balance= remainingBalance + interest
print("balance at end of month " + str(m) + " is $"+ str(round(balance,2)))