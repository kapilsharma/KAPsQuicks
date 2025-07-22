# Data Types

> JavaScript is **dynamically types**. This mean variables can hold values of any type and can change types during execution

## Primitive data types (7)

- String: "Hello World!"
- Number (Both int and float): 3, 5,5
- BigInt: Used for large numbers, that are beyone range of Number
- Boolean: true, false
- Undefined: `let x;`. Here x is currently Undefined. A variable without a value has type Undefined.
  - Don't confuse with `let x = ""`. It is empty string, not Undefoned.
- Null: `let x = null`
- Symbol: Used for unique identifier.

## Non primitive data type (1)

- Object: Special data type that can contain built-in and user-defined objects. Example: arrays, sets, maps, promise etc. Example

```JS
let person = {
  firstName: "Kapil",
  lastName: "Sharma"
};
```