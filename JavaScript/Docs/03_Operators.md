# Operators

For now, just adding some of the new operators

## Spread operator (...)

Spread operator return the values of an array

```js
const colors = ["red", "green"]
const newColor = ["blue"]

// Lets say, we wnat ot merge them
const allColors = [colors, newColor];
console.log(allColors);
// OP: [ [ 'red', 'green' ], [ 'blue' ] ]
// This is not we expected. It is array of arrays

const mixedColors = [...colors, ...newColor];
console.log(mixedColors);
// OP: [ 'red', 'green', 'blue' ]
```

It also works on the object

```JS
const user = {
  name: "Kapil",
  lastName: "Sharma"
}

const extendedUser = {
  ...user,  // This return key-value of user
  age: 40,
  email: "kapil@example.com"
}

console.log(extendedUser);
```

Its output will be

```bash
{
  name: 'Kapil',
  lastName: 'Sharma',
  age: 40,
  email: 'kapil@example.com'
}
```
