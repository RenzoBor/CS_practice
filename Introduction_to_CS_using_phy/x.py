class renzo():
    def __init__(self, edad, perros):
        self.edad=edad
        self.perros=perros
    def jugar(self):
        print(str(self.perros) + str(self.edad))
    def __str__(self) -> str:
        return "< " + "Renzo tiene "+ str(self.edad) + " perros >" 
    def __add__(self,other):
        return self.edad+other.edad

r= renzo(26,True)
e=renzo(20,False)
r.jugar()
print(r+e)