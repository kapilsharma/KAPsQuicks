# JavaScript Basics

We are making examplee in NodeJS environment. If needed, we can do most of these example is [browser](./01A_browser.md).

# New project

Assuming we have NodeJS installed (Google it, if not), we can initiate new project as

```bash
mkdir JSExamples
cd JSExamples
npm init -y
npm install
```

> Last command is not needed as we are not installing any 3rd party package for now. However, it is a good practice, that we will do in alsome all real projects.

## First example: Hello World and output

Make a new file, say print.js and write following code

> If filename given, code can be find on given path from JS root (JavaScript/JSExamples)

**File: HelloWorld.js**

```JS
console.log("Hello World!");
```

To execute the program, write `node HelloWorld.js`, it will print expected output on the console.

> We can use `console.log` for console output.

## Comments

In JS, we can have both single line and multi line comments

```JS
// This is a single line comment

/*
This is a 
multi line
comment
*/
```

## Variables

```JS
// Defining variables with 'var' keyword is no longer recommended
var a = 5;  // Not recommended

// We use let to define the comment
let b = 6;

// We can also use const, but they are constant and their values can't be changed in future
const C = 7;
```

## Type casting

**file: cast.js**

```JS
let x = "5.5";
let y = "6";

console.log(x);         // "5.5"
console.log(typeof x);  // String
console.log(y);         // "6"
console.log(typeof y);  // String

x_number = Number(x);
y_number = Number(y);

console.log(x_number);         // 5.5
console.log(typeof x_number);  // number
console.log(y_number);         // 6  
console.log(typeof y_number);  // number

x_int = parseInt(x);
y_float = parseFloat(y);

console.log(x_int);           // 5
console.log(typeof x_int);    // number
console.log(y_float);         // 6  
console.log(typeof y_float);  // number

// Internal type casting
z = +x;

console.log(x);         // 5.5
console.log(typeof x);  // string
console.log(z);         // 5.5
console.log(typeof z);  // number
```

JavaScript also provide functions for type casting

- x.toString()
- x.toExponential()
- x.toFixed()
- x.toPrecision

Above are the methods of Number object. JS provide several built-in objects. There list can be found at [https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects]()

## Code blocks

Like , PHP and most other language, we use curly braces {} to define a code block in JS

```JS
let x = 1;
while(x < 5) { // Code block start: While body
  console.log(x);
  x++;
} // Code block end
```