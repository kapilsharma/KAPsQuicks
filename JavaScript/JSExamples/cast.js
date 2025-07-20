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
