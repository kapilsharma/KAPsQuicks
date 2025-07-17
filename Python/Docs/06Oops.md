# Object Oriented Programming

## Class

```python
class MyClass: # Define the class
    x = 5

c1 = MyClass() # Create object
print(c1.x)  # 5 - Calling property
```

### Constructor and method

```python
class Person:
    def __init__(self, name, age):
        self.name = name
        self.age = age

    def speak(self):
        print("Hello, I'm {}. I'm {} years old.".format(self.name, self.age))

p1 = Person("Krits", 13)
p1.speak()
```

### Keyword `self`

Within class, `self` donate current object, similar to `this` in java, PHP, JS. it is always passed as first parameter in method definition. `self` is generic name but we can name it anything like

```python
class Person:
    def __init__(self, name, age):
        self.name = name
        self.age = age

    def speak(anything):
        print("Hello, I'm {}. I'm {} years old.".format(anything.name, anything.age))

p1 = Person("Krits", 13)
p1.speak()
```

### Magic methods

Above example `__init__` is constructor in general OOPs. In python, it is called magic method. They are identified by double underscore before and after name. Below example shows some other common magic methods.

```python
# An example class to represent a 2D vector (x and y coordinates)
class Vector2D:
    # This is a constructor, called whenever a new object is created
    def __init__(self, x, y):
        self.x = x
        self.y = y

    # It returns a HUMAN READABLE string representation of an object
    def __str__(self):
        return f"Vector2D({self.x}, {self.y})"

    # It returns a MACHINE-READABLE representation of an object. One usecase is debugging or logging the object
    def __repr__(self):
        return f"Vector2D(x={self.x}, y={self.y})"

    # It allows adding two Vector2D and return a new Vector2D as sum
    def __add__(self, other):
        if not isinstance(other, Vector2D):
            return f"You can't add {type(other)} to Vector2D"
        return Vector2D(self.x + other.x, self.y + other.y)

    # Difference between two Vector2D
    def __sub__(self, other):
        if not isinstance(other, Vector2D):
            return f"You can't subtract {type(other)} from Vector2D"
        return Vector2D(self.x - other.x, self.y - other.y)

    # Product of two Vector2D
    def __mul__(self, scalar):
        if not isinstance(scalar, (int, float)):
            return f"You can't multiple {type(other)} with Vector2D"
        return Vector2D(self.x * scalar, self.y * scalar)

    # Check if objects are equal
    def __eq__(self, other):
        if not isinstance(other, Vector2D):
            return f"You can't compare {type(other)} with Vector2D"
        return self.x == other.x and self.y == other.y

    # Check less than (Using Pythagoras theorem)
    def __lt__(self, other):
        if not isinstance(other, Vector2D):
            return f"You can't compare {type(other)} with Vector2D"
        return (self.x ** 2 + self.y ** 2) < (other.x ** 2 + other.y ** 2)

    def __len__(self):
        """Return the number of components (always 2 for 2D vector)."""
        return 2

    def __getitem__(self, index):
        """Allow indexing to access x (index 0) and y (index 1)."""
        if index == 0:
            return self.x
        elif index == 1:
            return self.y
        raise IndexError("Vector2D index out of range")

    def __abs__(self):
        """Return the magnitude of the vector."""
        return (self.x ** 2 + self.y ** 2) ** 0.5


# Example usage
# Create two vectors
v1 = Vector2D(3, 4)
v2 = Vector2D(1, 2)

# String representation
print(f"v1: {v1}")  # Uses __str__ -> v1: Vector2D(3, 4)
print(f"v1 repr: {repr(v1)}")  # Uses __repr__ -> v1 repr: Vector2D(x=3, y=4)

# Arithmetic operations
v3 = v1 + v2  # Uses __add__
print(f"v1 + v2 = {v3}")  # v1 + v2 = Vector2D(4, 6)

v4 = v1 - v2  # Uses __sub__
print(f"v1 - v2 = {v4}")  # v1 - v2 = Vector2D(2, 2)

v5 = v1 * 2  # Uses __mul__
print(f"v1 * 2 = {v5}")  # v1 * 2 = Vector2D(6, 8)

# Comparison operations
print(f"v1 == v2: {v1 == v2}")  # Uses __eq__  -> v1 == v2: False
print(f"v1 < v2: {v1 < v2}")  # Uses __lt__    -> v1 < v2: False

# Magnitude
print(f"Magnitude of v1: {abs(v1):.2f}")  # Uses __abs__  -> Magnitude of v1: 5.00

# Length
print(f"Length of v1: {len(v1)}")  # Uses __len__  -> Length of v1: 2

# Indexing
print(f"v1[0]: {v1[0]}")  # Uses __getitem__  -> v1[0]: 3
print(f"v1[1]: {v1[1]}")  # v1[1]: 4
```

## Inheritance

```python
class Person:
    def __init__(self, name, age):
        self.name = name
        self.age = age

    def printName(self):
        print(self.name)

# To extend/inherit, we give parent class name in `()`
class Employee(Person):
    pass

emp = Employee("Kapil", 40)
emp.printName()   # Kapil
```

### keyword `super`

```python
class Person:
    def __init__(self, name, age):
        self.name = name
        self.age = age

    def printName(self):
        print(self.name)

class Employee(Person):
    def __init__(self, name, age, employeeId):
        # This is not a clear way of calling. Since we are calling with Class name, we must pass self too
        Person.__init__(self, name, age)
        # More clean and modern way is (No need to pass self)
        # super().__init__(name, age)
        self.employeeId = employeeId

    def __str__(self):
        return f"Employee (Name: {self.name}, Age: {self.age}, EmployeeId: {self.employeeId})"

emp = Employee("Kapil", 40, "Emp123")
print(emp)
```

In init of Employee, we used `Person.__init__(self, name, age)` to call constructor of parent class. This works but we need to to pass `self` as first parameter as `Person` do not know which object it is called upon.

More modern and clean way is `super().__init__(name, age)`

## Iterator

Iterator is an object, that we can iterate to get countable values. List, Tuple, set, Dict are example of iterator, that python implements. They are iteratable because we can use them in, say for loop, to loop through all values.

We can also make our class iterator.

In python, a class is iteratable when it implements two methods

- __iter__ -> returns an object of iterator, in most cases `self`
- __next__ -> returns the next value of the sequence.

### Iterator example - FibonacciGenerator

Want to try yourself? Solution

```python
# Fibonacci series have the first two numbers as 0 and 1. From third number, it is the sum of the previous two numbers. Example
# 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89 .....

class FibonacciGenerator:
    # Initialization
    def __init__(self, count): # count the number of elements we want to generate.
        # Validation
        if not isinstance(count, int) or count < 1:
            raise ValueError("Count must be a positive integer")
        self.count = count # holds the number of elements to be generated
        self.current_index = 0  # Holds which number we are printing or number of iterations done
        self.a, self.b = 0, 1   # Initial two numbers of the series

    # Returns the iterator. In this case, self (FibonacciGenerator) is the iterator
    def __iter__(self):
        return self

    # Returns the next number of the series
    def __next__(self):
        # Check; did we reach the limit
        if self.current_index >= self.count:
            raise StopIteration  # Stop the iteration

        # Check: Is it the first number
        if self.current_index == 0:
            self.current_index += 1   # Increase the index
            return self.a   # Return the first number

        # Check: Is it the second number
        if self.current_index == 1:
            self.current_index += 1
            return self.b   # Return the second number

        # Calculate the next number
        next_number = self.a + self.b
        self.a, self.b = self.b, next_number
        self.current_index += 1
        return next_number

fib = FibonacciGenerator(10)
for number in fib:
    print(number, end=", ")  # 0, 1, 1, 2, 3, 5, 8, 13, 21, 34,
```

## Scope and `global`

```python
x = 5
y = 10
z = 15

def func():
    print(x)  # 5: Since not defined in current scope, it will take it from parent scope

    y = 12 # Local scope. It will not impact global y = 10
    print(y)  # 12

    global z  # Now any change will impact outer z
    z += 1    # Let's change the value
    print(z)  # 16

func()
print(x)  # 5 outer value
print(y)  # 10; not impacted by y in func()
print(z)  # 16; impacted in func as it was defined global
```
