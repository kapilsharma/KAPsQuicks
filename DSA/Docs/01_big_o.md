# Bog O Notation

- O(1)
  - No matter data size, it will take same time.
  - Example: Get first element of an array
    - No matter array have 5 elements or 5000, it will take same time.
- O(log n)
  - Example: Searching a word in dictionary as words are arranged alphabatically.
    - We open in the middle and depending on alphabatical order, look backword or forward.
    - So with each iteration, we cut the problem by half.
  - For smaller collection, time could be high but as size increase, time increment gets very small.
- O(n) - Linear time
  - n = Size of input data
  - Time increase linearly, as the data increases
  - Example: Find one name in unsorted list.
    - Worse case: name we are finding is at the end -> We need to go through each element.
- O (n log n)
- O (n<sup>2</sup>) - Quadratic time
  - Each item in a collection, need to interact with each other item.
  - Example Algorithm: Bubble sort & Selection sort.
  - Example: Print all pairs in an array

```python
def printAllPairs(arr):
  n = len(arr)
  for i in range(n):
    for j in range(n):
      print(arr[i], arr[j])
```

- o (n!)

