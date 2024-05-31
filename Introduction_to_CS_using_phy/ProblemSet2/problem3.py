balance=999999
annualInterestRate=0.18
MonthlyInterestRate = annualInterestRate / 12.0
MonthlyPaymentLowerBound = balance / 12
MonthlyPaymentUpperBound = balance * ((1 + MonthlyInterestRate)**12) / 12.0
MonthlyPaymentMid=(MonthlyPaymentUpperBound+MonthlyPaymentLowerBound)/2
while True:
    remainingBalance=balance
    for m in range(12):
        remainingBalance = remainingBalance - MonthlyPaymentMid
        interest= remainingBalance * MonthlyInterestRate
        remainingBalance=remainingBalance + interest
    if remainingBalance > 0:
        MonthlyPaymentLowerBound = MonthlyPaymentMid
    else:
        MonthlyPaymentUpperBound= MonthlyPaymentMid
    MonthlyPaymentMid=(MonthlyPaymentUpperBound+MonthlyPaymentLowerBound)/2
    if remainingBalance <0.01 and remainingBalance>-0.01:
        break
print(str(round(MonthlyPaymentMid,2)))
        
