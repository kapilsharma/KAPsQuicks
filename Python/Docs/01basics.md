# Python basics

## Print

We need print statement for output

```python
print("Hello world")
```

It has following syntax

`print(Object(s), sep=separator, end, file, flush)` where

- Object(s) - To be printed, will be converted to string
- sep=separator - Optional. Separator, if there are multiple objects. Default `''`
- end - Optional. What to print at the end. Default `\n`
- file - Optional. Object with write method. Default `sys.stdout`
- flush - Optional. Boolean. True = flush, False = buffered. Default `False`

## Comments

```python
# This is single line comment
```

Python generally do not have multi-line comment.

We can fake it using triple quotes. due to the fact Python ignores string literals that are not assigned to a variable.However, it is not recommended

```python
"""
This is a multi-line comment
Second line
This type of comment works, but not recommended.
"""
```

## Variables

```python
x = 5
y = 6
z = x + y
print(z)
```

### Casting

```python
x = str(3) # '3'
y = int(x) # 3
z = float(y) # 3.0
```

### Get type

```python
name = "Kapil"
age = 35
print(type(name)) # <class 'str'>
print(type(age))  # <class 'int'>
```

### Notes and Naming conventions

- Python variables are case-sensitive
- Can contain a-z. A-Z, 0-9, and _
- Cannot start with number

### Assigning multiple variables

```python
# Multiple assignment; All variables have same value
x = y = z = "name"

# We can also unpack a collection like
cities = ["Agra", "Bengaluru", "Chennai"]
city1, coty2, city3 = cities
```

## Code blocks

In most languages, we use curly braces `{` and `}` to start and end a code block.

In python, we start code block with `:` and block body is decided by indentation. Block finishes when indentation finishes.

```python
a = 0
while a < 5:   # Block start at `:`
    print(a)
    a += 1
print("loop finished") # This is outside while block as indentation return to while's level.
```