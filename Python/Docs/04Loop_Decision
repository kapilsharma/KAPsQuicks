# Decisions

## if, elif, else

Same as in other languages, syntax:

```python
a = 5
b = 6
if a > b:
    print("a is greater than b")
elif a < b:
    print("a is less than b")
else:
    print("a is equal to b")
```

### and, or, not, pass

```python
a = 5
b = 6
c = 7
if a < b and a < c:         #true
    print('a is smallest')
if b < a or b < c:          # true as second condition is true
    print('b is not biggest')
if not a > b:               # true (not false)
    print('a is not greater than b')

# if can't be enpty in Python. If we need it empty, need to specifically specify
if a < b:
    pass
```

## Match case

Equivalent to switch in languages like PHP and JS

Difference: We do not have break. Python `match` exists after first match

```python
# num = 3
num = 6
match num:
    case 1 | 2:  # checking multiple values in same case. Since we do not have break, we check multiple cases like that.
        print("It is two") # not printed for 3 / 6
    case 3:
        print("It is three") # not printed for 6
    case _:  # default value
        print("It is neither") # printed for 6
```

### Conditional case

```python
month = 5
day = 4
match day:
  case 1 | 2 | 3 | 4 | 5 if month == 4:
    print("A weekday in April")
  case 1 | 2 | 3 | 4 | 5 if month == 5:
    print("A weekday in May")
  case _:
    print("No match")
```

# Loops

## While

Same as in other language

```python
i = 1
while i < 10:
  print(i)
  i += 1
  if i == 3:
      i += 1    # i = 3 will be missed
      continue  # Break current iteration
  print("---")  # Wont be printed after 2 (i = 3) due to continue
  if i == 5:    # Stop loop once i reached 5
    break
```

output

```
1
---
2
4
---
```

### while else

```python
i = 1
while i < 6:
  print(i)
  i += 1
else:
  print("i is no longer less than 6")
```

## For loop

For in python is not like for in C, PHP, JS, Java. It is more like `for in` on JS

> We can use break, continue and pass as in while loop

```python
fruits = ["apple", "banana", "cherry"]
for x in fruits:
  print(x)
  if x == "banana":
    break
```

### For like in other language and else

Since we do not have initial value and increment like in other language, we can use `range(initial, final, increment)`

- `range(5)` = 0, 1, 2, 3, 4
  - initial default = 0
  - final - 4 (less than given 5)
  - increment - default = 1
- `range(1,5)` - 1, 2, 3, 4
- `range (5, 0, -1)` - 5, 4, 3, 2, 1

`else` part will execute once loop finishes.

```python
for i in range(1, 6):
    for j in range(i, 0, -1):
        print(j, end=" ")
    print("")  # for line break
else:
    print("Complete")

# Output
# 1
# 2 1
# 3 2 1
# 4 3 2 1
# 5 4 3 2 1
# Complete
```