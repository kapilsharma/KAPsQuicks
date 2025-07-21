# Array

- Fundamental data structure
- Store Sequence of elements
- Can be access via an index

## Key characterstics
- **Homogeneity**: All elements have same type
- **Contiguous memory**: elements stored in adjacent memory locations for quick access.
- **Fixed size**: Originally fixed in size (needed for memory allocation in advance)
  - Dynamic array exists in modern languages.
- **Indexed**: 0 based index (first element index = 0)
  - Some language have 1 based index (First element index = 1)

## Time complexity

- Access: O(1)
- Search: O(1), O(n) for unsorted array
- Insertion:
  - O(1): at the end
  - O(n) at beginning/middle
- Deletion
  - O(1): at the end
  - O(n) at beginning/middle

## Array Syntax in different languages

**Java**

```java
int[] a = {1,2,3};
```

**JavaScript**

```JS
let a = [1,2,3];
```

**PHP**

```php
$a = [1,2,3];
```

**Python**

```Python
// In Python, we call it a list
a = [1,2,3];
```

**C++**

```CPP
int a[] = {1,2,3};
```

## Array in dynamically types language (PHP, Python, JS)

- In looosly typed languages, like JavaScript, PHP, Python,
  - we don't define size in advance,
  - we can also add different type if data in the array.
- Impact:
  - Python (list): Truly implement array data structure
    - Python allow dynamic array but it is not a linked-list.
    - It use data in continuous block of memory
    - While resize, it internally allocate new larger array and copy data from old array memory location to new.
  - Java Script: Pratially array data type
    - For numeric array, uses continuous memory
    - For sparse array (Where index is not sequencial), it may switch to hash-table like structure (dictionary, or map)
  - PHP: Not true array in traditional sense
    - PHP array support both indexed and key-value (associative array) type. This makes it more like hash table than array.
    - indexed array: PHP optimize storage but not traditionally like continuous memory blocks like in C++.

# Dynamic array

- Start with preset capacisy
  - Adjust size, when needed
    - Allocate new memory of bigger size
    - Copy existing elements to new memory
- Example
  - ArrayList in Java

# Associative Array (Dictionary)

- Often referred as
  - Map
  - Hash
  - Dictionary
- Enables key-value pair
- Offers dynamic resizing and fast retrieval
- Example implementation in different languages:
  - Java - HashMap
  - C++ - std::unordered_map
  - PHP - Associative array
  - Python - Dict
  - JavaScript - Object.
    - Map - Since ES6+
  - TypeScript - Map, Record
  - Go - Map
  - Scala - Map (scala.collection.immutable.HashMap)

# Consideration for use

- Advantage (Arrays are good)
  - Speed: O(1) performance for access and append/remove at end.
  - Good performance for sequential data access (Dur to contiguousmemory layout)
- Disadvantage (Linked list could be better?)
  - Size limitation: 
    - Fixed size
    - Resize needs copying data to new locations -> Not good when resizing is needed frequently
  - Mid-Array change: have O(n) performance due to element shifting