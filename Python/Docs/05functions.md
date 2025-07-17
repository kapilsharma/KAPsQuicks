# Functions

## Create and call

```python
# Create a function
def my_function():
    print("Hello from a function")

# call it
my_function()
```

## Arguments

```python
def my_function(fname, lname):
  print(fname + " " + lname)

my_function("Kapil", "Sharma")
```

## Arbitrary arguments (*args) and return

```python
def total_marks(*marks):
  total = 0
  for mark in marks:
    total += mark
  return total  # This is how we return value in python

total = total_marks(1,2,3,4)
print(f"Total marks were {total}")
```

## Keyword arguments

With keyword arguments, we can change their order

```python
def show_result(gold, silver, bronze):
    print(f"First - {gold}, Second - {silver}, Third - {bronze}")

show_result(bronze="Kapil", silver="Rits", gold="Krits")
```

## Arbitrary keyword arguments (**args)

```python
def show_result(**players):
    print(f"First - {players['gold']}")

show_result(tenth="Kapil", fifth="Rits", gold="Krits")
```

## Default parameter

Like in PHP, we can have default params in Python

```python
def student(firstname, lastname ='', school = ''):
    pass
```

## Positional only argument

If we do not want to allow keyword argument, we can define last parameter as `/`.

```python
def my_function(x, /):
  print(x)

my_function(3)   # This will work
my_function(x=3) # This will fail
```

## Keyword only argument

If we do not want to allow positional arguments, we can pass first parameter as `*`

```python
def my_function(*, x):
  print(x)

my_function(x = 3) # This will work
my_function(3)     # This will fail
```

## Lambda function

Lambda function is a small, one-line, anonymous function like arrow function in JS.

Syntax: `lambda argument : expression`. Example

```python
x = lambda a, b : a * b
print(x(5, 6))  # 30
```

There could be multiple use-case of lambda. Once such usecase is to create dynamic functions following a rule

```python
# Function that returns a function
def power(n):
    return lambda a : a ** n

square = power(2)  # Create a function to find square of a number
cube = power(3)    # Create a function to find cude of a number

print(square(3))  # 9
print(cube(3))    # 27
```