import math 

def polysum (n, s):
    
    #We get the area
    area = (0.25*n*(s**2)) / math.tan((math.pi / n))
    
    #We get the squared perimeter
    perimeterSquare = n * n * s * s
    
    #We add the area and the Squared Perimeter
    suma = area + perimeterSquare
    
    #We return the rounded sum to 4 decimals
    return round(suma,4)
    
print (polysum(5,10))