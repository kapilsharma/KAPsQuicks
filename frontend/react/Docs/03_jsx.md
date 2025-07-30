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

## JSX is not mandatory

Although most React project use JSX, there is an alternative. Consoder following JSX

```JSX
<div id="content">
  <p>Hello World!</p>
</div>
```

We can write same code in JS as follow

```JS
React.createElement(
  'div',
  { id: 'content' },
  React.createElement(
    'p',
    null,
    'Hello World!'
  )
);
```

Second option is pure Js option and we will not need and build process for that.

Still, this is not an easy approach, and build tools are really pretty simple and straight forward. Thus, most people prefer JSX route, which is simple and readable.

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

## Conditionally rendering contents

There are total four ways to render contents. In following example, consider we have content

```
const [ content, setContent ] = useStage();
```

Since we didn't set initial value of content, it is undefined.

Now there are four ways to display the contents conditionally and we can use any depending on situation. Suppose we want to show content, when it is set otherwise show 'No contents' string.

### Option 1: In JS

```JSX
let tabContent = "No content";
if(content) {
  tabContent = content
}

return (
  <p>
    {tabContent}
  </p>
)
```

### Option 2: Two JSX contidion

```JSX
return (
  <p>
    {!content ? "No Content" : null}
    {content ? content : null}
  </p>
)
```

### Option 3 (Option 2 with &&)

```JSX
return (
  <p>
    {!content && "No Content"}
    {content && content}
  </p>
)
```

### Option 4 (single ternary)

```JSX
return (
  <p>
    {!content ? (
      "No Content"
    ) : (
      content
    )}
)
```

## Fragment

- We can return only one tag from react.
- If we need to return multiple tags, we generally wrap them in `<div>`.
  - Downside: One extra div in the DOM
- Earlier versions of React have Fragment as a solution

```JSX
import { Fragment } from 'react';
 
// ... other code ...
 
return (
  <Fragment>
    <h2>Welcome!</h2>
    <p>React is awesome!</p>
  </Fragment>
);
```

However, now we can use special `<>` and `</>` tags.

```JSX
// no import needed
 
return (
  <>
    <h2>Welcome!</h2>
    <p>React is awesome!</p>
  </>
);
```
