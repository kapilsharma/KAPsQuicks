# Destructure

```JS
const user = ["Kapil", "Sharma"];

const firstName = user[0];
const lastName = user[1];

// We can write above code as
const [firstName, lastName] = ["Kapil", "Sharma"];
```

Same works for object too

```JS
const user = {
  firstName: "Kapil",
  lastName: "Sharma"
}

const firstName = user.firstName;
const lastName = user.lastName;

// Same can be written as
const { firstName, lastName } = {
  firstName: "Kapil",
  lastName: "Sharma"
}
// In object, destructured variable name must be same as key
```

## Destructure function parameters

```JS
function storeOrder(order) {
  localStorage.setItem('id', order.id);
  localStorage.setItem('currency', order.currency);
}
```

It can be written as

```JS
function storeOrder({id, currency}) { // destructuring
  localStorage.setItem('id', id);
  localStorage.setItem('currency', currency);
}
```