class Coordinate(object):
    def __init__(self, x, y):
        self.x = x
        self.y = y

    def getX(self):
        # Getter method for a Coordinate object's x coordinate.
        # Getter methods are better practice than just accessing an attribute directly
        return self.x

    def getY(self):
        # Getter method for a Coordinate object's y coordinate
        return self.y

    def __str__(self):
        return '<' + str(self.getX()) + ',' + str(self.getY()) + '>'
    def __eq__(self, other) -> bool:
        if self.getX() == other.getX() and self.getY() == other.getY():
            return True
        else:
            return False
a= Coordinate(3,2)
b=Coordinate(1,2)
c=Coordinate(1,2)
class intSet(object):
    """An intSet is a set of integers
    The value is represented by a list of ints, self.vals.
    Each int in the set occurs in self.vals exactly once."""

    def __init__(self):
        """Create an empty set of integers"""
        self.vals = []

    def insert(self, e):
        """Assumes e is an integer and inserts e into self""" 
        if not e in self.vals:
            self.vals.append(e)

    def member(self, e):
        """Assumes e is an integer
           Returns True if e is in self, and False otherwise"""
        return e in self.vals

    def remove(self, e):
        """Assumes e is an integer and removes e from self
           Raises ValueError if e is not in self"""
        try:
            self.vals.remove(e)
        except:
            raise ValueError(str(e) + ' not found')

    def __str__(self):
        """Returns a string representation of self"""
        self.vals.sort()
        return '{' + ','.join([str(e) for e in self.vals]) + '}'
    def getValues(self):
        return self.vals
    def intersect(self, other):
        commonValues=intSet()
        selfValues=self.getValues()
        otherValues=other.getValues()
        for sv in selfValues:
            for ov in otherValues:
                if sv == ov:
                    commonValues.insert(sv)
        if commonValues.getValues()==[]:
            return"No values in common"
        return commonValues



    
st1= intSet()
st2= intSet()
st1.insert(3)
st1.insert(4)
st1.insert(6)
st1.insert(7)
#st2.insert(6)
#st2.insert(3)
st2.insert(8)
st2.insert(9)
print(st1)
print(st2)
print(st1.intersect(st2))