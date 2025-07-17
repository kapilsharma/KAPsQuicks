# Data Types

| Text Type:      | `str`                              |
| --------------- |------------------------------------|
| Numeric Types:  | `int`, `float`, `complex`          |
| Sequence Types: | `list`, `tuple`, `range`           |
| Mapping Type:   | `dict`                             |
| Set Types:      | `set`, `frozenset`                 |
| Boolean Type:   | ``NoneTypbool`                     |
| Binary Types:   | `bytes`, `bytearray`, `memoryview` |
| None Type:      | `NoneType`                         |

## Examples

| Example                                      | Data Type  |
| -------------------------------------------- | ---------- |
| x = "Hello World"                            | str        |
| x = 20                                       | int        |
| x = 20.5                                     | float      |
| x = 1j                                       | complex    |
| x = ["apple", "banana", "cherry"]            | list       |
| x = ("apple", "banana", "cherry")            | tuple      |
| x = range(6)                                 | range      |
| x = {"name" : "John", "age" : 36}            | dict       |
| x = {"apple", "banana", "cherry"}            | set        |
| x = frozenset({"apple", "banana", "cherry"}) | frozenset  |
| x = True                                     | bool       |
| x = b"Hello"                                 | bytes      |
| x = bytearray(5)                             | bytearray  |
| x = memoryview(bytes(5))                     | memoryview |
| x = None                                     | NoneType   |

## Casting

| Example                                      | Data Type  |
| -------------------------------------------- | ---------- |
| x = str("Hello World")                       | str        |
| x = int(20)                                  | int        |
| x = float(20.5)                              | float      |
| x = complex(1j)                              | complex    |
| x = list(("apple", "banana", "cherry"))      | list       |
| x = tuple(("apple", "banana", "cherry"))     | tuple      |
| x = range(6)                                 | range      |
| x = dict(name="John", age=36)                | dict       |
| x = set(("apple", "banana", "cherry"))       | set        |
| x = frozenset(("apple", "banana", "cherry")) | frozenset  |
| x = bool(5)                                  | bool       |
| x = bytes(5)                                 | bytes      |
| x = bytearray(5)                             | bytearray  |
| x = memoryview(bytes(5))                     | memoryview |

# Numbers

There are three types; integer, float, complex

Integer and float are same as in other languages. Complex can be done as `x = 3+4j`. In Maths we generally write iota as `i` but in python, we make complex number by using `j`.

# Strings

Same as in other langiages. Can be written with `x = 'single quote'` or `y = "double quote"`. We can also have multiline strings with 3 single/double quotes

```python
multi = """This is a multi-line string
It is also part of same string
"""
```

> We used same trick for multi-line comments and the fact if string is not assigned to a variable, it is not interpreted by python. However, this is not a recommended method.

## String as array

String is an array of characters

```python
a = "Hello world!"
print(a[0]) # H
print(len(a)) # 12
```

In python, an array (We call it list in python) is a collection data type (See next section), so cna use its functions as in line 3 of above code

## Search string with `in`

```python
txt = "The best things in life are free!"
print("free" in txt) # True
print("expensive" not in txt) # True
```

## String slicing

```python
s = "Hello Wprld!"
print(s[2:4]) # ll
# last limit is exclusive, so its like x <= 2 & x < 4

# Slicing from start & to the end
print(s[:5]) # Hello
print(s[6:]) # World!

# Negative index
print(s[-5:-2]) # orl
```

## String modification

- s.upper()
- s.lower()
- s.capitalize() -> Change first character capital
- s.title() -> Capitalize first letter of each word
- s.strip() -> Remove white space from start and end
- s.lstrip() -> strip from left
- s.rstrip() -> strip from right
- s.replace("H", "J") -> Jello World!
- s.split(" ) -> ['Hello', 'World!']

## Concat (+)

```python
a = "Hello"
b = "World"
print(a + b) # HelloWorld
print(a + " " + b) # Hello World
```

## Format string

```python
name = "Kapil"
exp = 123
print(f"My name is {name}"     #My name is Kapil
print(f"My exp is {exp}")      #My exp is 123
print(f"My exp is {exp:.2f}")  #My exp is 123.00

exp2 = 6
print(f"Total expanse is {exp + exp2}") #Total expanse is 129
```

More methods can be found at https://docs.python.org/3/library/string.html and 
https://docs.python.org/3/library/stdtypes.html#textseq

# List vs tuple vs set vs dict

|                | List               | Tuple              | Dict                                          | Set                                                                                   |
| -------------- | ------------------ | ------------------ | --------------------------------------------- | ------------------------------------------------------------------------------------- |
| Notation       | []                 | ()                 | {}                                            | {}                                                                                    |
| Example        | ['a', 'b']         | ('a', 'b')         | {<br>    "a": "A", <br>	"b": "B"<br>}         | {'a', 'b'}                                                                            |
| Mutability     | Mutable            | Immutable          | Mutable, keys are immutable, value can change | Mutable, but elements are immutable. We can add/remove element but can't change them. |
| Order          | Maintains          | Maintains          | Python 3.7+: Insertion order is preserved.    | Not maintainsed                                                                       |
| Duplicate      | Allow              | Allow              | Unique key, value can be duplicate            | Don't allow                                                                           |
| Data Structure | Ordered collection | Ordered collection | Key-value pair                                | Unordered Collection                                                                  |
| Index          | Start from 0       | Start from 0       | key based indexing                            | No indexing                                                                           |

# Sequence type

There are three; list, tuple, range

## List ([])

It is equivalent to an indexed array in PHP, JavaScript and others.

> Note: In python, dictionary is equivalent JS object and PHP's associative array

**Quick example**

```python
myList = ["a", "b", "c", "d", "e"]
print(myList)        # ['a', 'b', 'c', 'd', 'e']
print(myList[1])     # b
print(myList[-1])    # e
print(len(myList))   # 5
print(myList[1:4])   # ['b', 'c', 'd']
print(myList[:2])    # ['a', 'b']
print(myList[3:])    # ['d', 'e']
print(myList[-3:-1]) # ['c', 'd']
```

Changing list elements

```python
myList = ["a", "b", "c", "d", "e"]

# Change one element
myList[1] = "B"
print(myList)             # ['a', 'B', 'c', 'd', 'e']

# Change range
myList[2:4] = ["C", "D"]
print(myList)             # ['a', 'B', 'C', 'D', 'e']

myList.append("f")
print(myList)             # ['a', 'B', 'C', 'D', 'e', 'f']
myList.insert(1, "b")
print(myList)             # ['a', 'b', 'B', 'C', 'D', 'e', 'f']
secondList = ["G", "H"]
myList.extend(secondList)
print(myList)             # ['a', 'b', 'B', 'C', 'D', 'e', 'f', 'G', 'H']
myList.remove("b")
print(myList)             # ['a', 'B', 'C', 'D', 'e', 'f', 'G', 'H']

# pop with index
myList.pop(1)
print(myList)             # ['a', 'C', 'D', 'e', 'f', 'G', 'H']
# pop without index remove last item
myList.pop()
print(myList)             # ['a', 'C', 'D', 'e', 'f', 'G']
```

List are fine for generic use in python. However, if we need to work on numeric values a lot, like in Data Science, we must check [NumPy](21NumPy.md).

## Tuple [()]

Tuple is ordered and unchangeable. We can consider it as an immutable list.

**Use of tuple**: It is a common to ask why we need tuple, if we already have list. We can decide between List and Tuple based on requirements but here are some usecase:

- Immutable data storage
  - `screenSmallLandscape = (640, 480)`
- Multiple return value, that we may not want to change
  - Example, return coordinates from a function
- Dictionary keys: Map coordinates to a location
- Efficient iteration. Tuple are more memory efficient than lists, making them suitable for large datasers where immutability is acceptable.
- Data integrity: Prevent accidental modification

## Sets

Sets are much like List with following notable differences

- Don't allow duplicate values
- Can add and remove values but can't change them.
- They are not ordered so there is no index.

Usage

```python
# Removing duplicates
numbers = [1, 2, 3, 2, 1, 5, 4, 5, 7, 9, 7, 8]
unique_numbers = set(numbers)
print(sorted(unique_numbers))  # [1, 2, 3, 4, 5, 7, 8, 9]

# Mathematical set operations
set1 = {1, 2, 3, 4}
set2 = {3, 4, 5, 6}
# Union
print(set1 | set2)  # {1, 2, 3, 4, 5, 6}
# Intersection
print(set1 & set2)  # {3, 4}
# Difference
print(set1 - set2)  # {1, 2}
# Symmetric difference
print(set1 ^ set2)  # {1, 2, 5, 6}
```

- Sets are implemented as hasg tables. Impact
  - Adding/removing elements and membership testing is efficient (Average time complexity is `O(1)`)

## Dictionary

Dictionary in Python is like associative array in PHP or like Object in Java Script.

Value can be of any data type, so easily converted to and from JSON. Some common functions

| Method       | Description                                                                                                 |
| ------------ | ----------------------------------------------------------------------------------------------------------- |
| clear()      | Removes all the elements from the dictionary                                                                |
| copy()       | Returns a copy of the dictionary                                                                            |
| fromkeys()   | Returns a dictionary with the specified keys and value                                                      |
| get()        | Returns the value of the specified key                                                                      |
| items()      | Returns a list containing a tuple for each key value pair                                                   |
| keys()       | Returns a list containing the dictionary's keys                                                             |
| pop()        | Removes the element with the specified key                                                                  |
| popitem()    | Removes the last inserted key-value pair                                                                    |
| setdefault() | Returns the value of the specified key. If the key does not exist: insert the key, with the specified value |
| update()     | Updates the dictionary with the specified key-value pairs                                                   |
| values()     | Returns a list of all the values in the dictionary                                                          |