# Linear Data Structure

- Data elements are arranged sequentially or linearly
- Have unique predecessor and successor (except first and last)
- Use case: Organize and manipulate data in specific order

## Types

- [Array](./11_array.md)
- Linked list
- Stack
- Queue

## Operations

Following operations are generally supported by most linear data structures.

### Traversal / Access
- Access each element sequentially.
- Example: Array traversed through loop, that iterate each index

### Search

- Finding specific element within data structure
- Multiple search algorithms are present depending on Data Structure

### Insertion and deletion

- Add remove elements to the data structure
- In Array:
  - While addition, we need to make space for new element, as array have fixed width.
  - This often require copying array to new memory location.
  - While deletion, we may need to shift elements in memory location to keep it continuous, specially if it is done in middle/start
- In linked list
  - Addition operation is quick as linked list do not have continuous memory location
  - Even if we add an element in middle, we have to just update reference of previous element.