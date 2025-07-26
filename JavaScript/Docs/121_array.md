# Array

Array works same as in other languages.

## Defining an array

```JS
// Define in most common way
const arr1 = ['red', 'green']

// Define as Array object
const arr2 = new Array('yello', 'megenta')
// Or alternatively
const arr3 = Array('Cyan');

// We can use spread operator to mix two arrays and create new array
const primaryColors = [...arr1, "blue"];
const printColors = [...arr2, ...arr3];

console.log(primaryColors);  // [ 'red', 'green', 'blue' ]
console.log(printColors);    // [ 'yello', 'megenta', 'Cyan' ]
```

## Array class

```js
// We can also initialize an empty array as follow
const emptyArray = Array(5);
console.log(emptyArray); // [ <5 empty items> ]
const emptyArray2 = new Array(3);
console.log(emptyArray2); // [ <3 empty items> ]

// We can create array using from keyword
// Syntax: console.log(Array.from([1, 2, 3], (x) => x + x));
console.log(Array.from("Kapil")); //[ 'K', 'a', 'p', 'i', 'l' ]
console.log(Array.from([1, 2, 3], x => x * 2));  // [ 2, 4, 6 ]

// Its one practical usecase is to get array of keys and values
const mapper = new Map([
  ["1", "a"],
  ["2", "b"],
]);
console.log(Array.from(mapper.values())); // ['a', 'b'];
console.log(Array.from(mapper.keys()));   // ['1', '2'];
```

# Common and useful array functions

## Filter (Array.prototype.filter)

Filter method is used to make a shallow copy of an array

> Shallow copy: Make copy of primitive and copy reference of array and objects

- Syntax: `filter(callbackFn, thisArg)`
  - thisArg is optional. Its default values is
    - Strict mode: `undefined`
    - Non-string mode
      - Browser: `window`
      - NodeJS: `global`

> Using strict mode is highly recommended, so we can mostly consider default value of `thisArg` is `undefined`.


```JS
const words = ["spray", "elite", "exuberant", "destruction", "present"];
// Shallow copy, is only for objects and array
const result = words.filter((word) => word.length > 6);

console.log(result);  // [ 'exuberant', 'destruction', 'present' ]
result[0] = "exu";

console.log(result);  // [ 'exu', 'destruction', 'present' ]
// Words are unchanges because primitive (string) is deep copy, not shallow copy.
console.log(words);   // [ 'spray', 'elite', 'exuberant', 'destruction', 'present' ]

// Shallow copy example (Works for array and objects)
const objects = [{ id: 1 }, { id: 2 }, { id: 3 }];
const filteredObjects = objects.filter(obj => obj.id > 1);

// This is actual shallo copy (Reference to original objects)
console.log(filteredObjects); // [{ id: 2 }, { id: 3 }]

filteredObjects[0].id = 10; // Modify the 'id' property of the first object in filteredObjects
console.log(filteredObjects); // [{ id: 10 }, { id: 3 }]

// Since shallow copy, it will update original object too.
console.log(objects); // [{ id: 1 }, { id: 10 }, { id: 3 }]
```

### Example of thisArg

```JS
const thresholdObj = {
  threshold: 10,
  isAboveThreshold: function (number) {
    return number > this.threshold;
  },
};

const numbers = [5, 12, 8, 15, 3, 20];

// Use filter() with thisArg to set `this` to thresholdObj
const filteredNumbers = numbers.filter(thresholdObj.isAboveThreshold, thresholdObj);

console.log(filteredNumbers); // [12, 15, 20]
```

## Map (Array.prototype.map())

The map() method of Array instances creates a new array populated with the results of calling a provided function on every element in the calling array.

```JS
const array = [1, 4, 9, 16];

const mapped = array.map( x => x * 2 );

console.log(mapped); // [2, 8, 18, 32]
```

Let's check another example, where we update an array of objects

```JS
const kvArray = [
  { key: 1, value: 10 },
  { key: 2, value: 20 },
  { key: 3, value: 30 },
];

const reformattedArray = kvArray.map(({ key, value }) => ({ [key]: value }));

console.log(reformattedArray); // [{ 1: 10 }, { 2: 20 }, { 3: 30 }]
```

## Reduce (Array.prototype.reduce())

Reduce function reduce and array to a single value.

It do it by executing a supplied function (Called reducer function) to each value of the array. Example

```JS
const array = [1, 2, 3, 4];

// 0 + 1 + 2 + 3 + 4
const initialValue = 0;
const sumWithInitial = array.reduce(
  (accumulator, currentValue) => accumulator + currentValue,
  initialValue,
);

console.log(sumWithInitial); // 10
```

In above example:

- Reduce takes two parameters.
  - Function - To be called on each element and return one value
    - Param 1: accumulator (Can use different name)
      - For first iteration, it is initial value
      - For remaining itereation, it is the value of previous iteration
      - If initial value is not provided, index 0 becomes initial value and iteration start from index 1.
    - Param 2: currentValue (Can use different name) is the array value of current iteration
  - initialValue - Opetional.
  
## Slice

```JS
const animals = ["ant", "bison", "camel", "duck", "elephant"];

console.log(animals.slice(2));
// Expected output: Array ["camel", "duck", "elephant"]

console.log(animals.slice(2, 4));
// Expected output: Array ["camel", "duck"]

console.log(animals.slice(1, 5));
// Expected output: Array ["bison", "camel", "duck", "elephant"]

console.log(animals.slice(-2));
// Expected output: Array ["duck", "elephant"]

console.log(animals.slice(2, -1));
// Expected output: Array ["camel", "duck"]

console.log(animals.slice());
// Expected output: Array ["ant", "bison", "camel", "duck", "elephant"]
```

## Splice

Syntax

- splice(start)
- splice(start, deleteCount)
- splice(start, deleteCount, item1)
- splice(start, deleteCount, item1, item2)
- splice(start, deleteCount, item1, item2, /* …, */ itemN)

```JS
const months = ["Jan", "March", "April", "June"];
months.splice(1, 0, "Feb");
// Inserts at index 1
console.log(months);
// Expected output: Array ["Jan", "Feb", "March", "April", "June"]

months.splice(4, 1, "May");
// Replaces 1 element at index 4
console.log(months);
// Expected output: Array ["Jan", "Feb", "March", "April", "May"]
```
