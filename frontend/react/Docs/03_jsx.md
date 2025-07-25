# javaScript XML (JSX)

- JSX is stricter that HTML. It follow XML rules
    - Closing tag is mandatory like `<br />`
    - Must have root tag.
        - Can't return more than one tag. If we need to return more than one tag, we wrap them in `<div> ... </div>` or empty `<> ... </>` wrapper.
- For `class`, we need to use `className` (class is reserved keyword in JS)
- We can display variables values like `{ user.name }`.
    - We can also put complex expressions in `{ ... }`
- For style, we use `style={{ ... }}`.
    - It is not a special syntax but regular JS objext inside `style = { }`.
    - We use that when style attribute depends on JS variable.

## Conditional rendering

```jsx
let content;
if (isLoggedIn) {
  content = <AdminPanel />;
} else {
  content = <LoginForm />;
}
return (
  <div>
    {content}
  </div>
);
```

We can also conditionally render components like

```jsx
<div>
  {isLoggedIn ? (
    <AdminPanel />
  ) : (
    <LoginForm />
  )}
</div>
```

If else part is not eneded, we can use

```jsx
<div>
  {isLoggedIn && <AdminPanel />}
</div>
```

## Rendering list

```jsx
const products = [
  { title: 'Cabbage', id: 1 },
  { title: 'Garlic', id: 2 },
  { title: 'Apple', id: 3 },
];

const listItems = products.map(product =>
    <li key={product.id}>
        {product.title}
    </li>
);

return (
    <ul>{listItems}</ul>
);
```

> Note: We have `key` attribute inside <li>. It must be unique.


