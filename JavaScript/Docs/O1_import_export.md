# Import and export

We can import some code (varialbe,function) from one JS file to other.

Let's take example of two files. util.js and app.js. We are going to import things form util.js to app.js

Exporting variable. This is called `named export`.

```js
// util.js
export let someKey = "Some value";

// app.js
import { someKey } from "./util.js";
console.log(someKey); // OP: Some value
```

We can even export multiple values

```JS
// util.js
export let someKey = "Some value";
export let otherKey = "Other Value";

// app.js
import { someKey, otherKey } from "./util.js";
console.log(someKey);  //OP: Some value
console.log(otherkey); //OP: Other Value
```

`Default export`: We can mark some value as default export

```JS
// util.js
// Default export must be a value or function
export default "Default string";

// app.js
// We can give default value any name
import anyName from "./util.js";
console.log(anyName); //OP: Default string
```

We can mix named variables and default export

```JS
// util.js
export let someKey = "Some value";
export let otherKey = "Other Value";
export default "Default string";

// app.js
// we can import everything but in that case, we must give it a name
import * as util from "./util.js";
console.log(util.someKey);  //OP: Some value
console.log(util.otherKey); //OP: Other Value
console.log(util.default);  //OP: Default string
```
We can use `as` keyword for non-dafault import too

```JS
// util.js
export let someKey = "Some value";
export let otherKey = "Other Value";

// app.js
import { someKey as key, otherKey } from "./util.js:
console.log(key);      //OP: Some value
console.log(otherKay); //OP: Other Value
```
