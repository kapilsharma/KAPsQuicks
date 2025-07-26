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

// On object
const user = {
  name: "Kapil",
  lastName: "Sharma"
}

const extendedUser = {
  ...user,
  age: 40,
  email: "kapil@example.com"
}

console.log(extendedUser);