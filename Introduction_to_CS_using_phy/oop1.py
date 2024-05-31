class Person():
    id=0
    def __init__(self, name, age):
        self.name=name
        self.age=age
        self.lastname= self.name.split(" ")[-1]
        self.id=Person.id
        Person.id+=1
    def getName(self):
        return self.name
    def getAge(self):
        return self.age
    def getLastname(self):
        return self.lastname
    def getId(self):
        return self.id
    def __str__(self):
        return self.name + " " + str(self.age)
    def __lt__(self,other):
        assert type(self) == type(other), "Can't compare different types"
        return self.getAge()<other.getAge()
class Doctor(Person):
    pass
p1=Person("Renzo Borraccini", 26)
p2=Person("Nicolas Torales", 19)
p3=Person("Bruno Borraccini", 20)
grupo=[p1,p2,p3]
grupo.sort()
print(p1)
print(grupo[0])
p4=Doctor("Fernando Rublo", 44)
print(p4.getLastname())
