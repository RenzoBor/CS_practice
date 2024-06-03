import math
def polysum(n, s):
    '''
    input: n= number of sides of the regular polygon
           s= length of each side of the regular polygon
    output: The sum of the area and the square of the perimeter, rounded 4 decimals
    '''
    perimeter = n*s
    area= (0.25*n*(s**2))/(math.tan(math.pi/n))
    print("perimeter: " +str(perimeter))
    print("area: "+str(area))
    return round(area+perimeter**2,4)
print(polysum(5,10))