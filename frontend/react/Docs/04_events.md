# Events

```jsx
function MyButton() {
  function handleClick() {
    alert('You clicked me!');
  }

  return (
    <button onClick={handleClick}>
      Click me
    </button>
  );
}
```

## Event popping up

Example of event in child Component (TabButton) to go up to parent component (SomeComponent)

```JSX
function TabButton({ children, onSelect}) {
  return (
    <li><button onClick={onSelect}>{children}</button></li>
  );
}

function SomeComponent() {
  function handleSelect(selectedButton) {
    console.log(selectedButton);
  }

  return (
    <menu>
      <TabButton onSelect={() => handleSelect('components')}>Components</TabButton>
      <TabButton onSelect={() => handleSelect('jsx')}>JSX</TabButton>
      <TabButton onSelect={() => handleSelect('props')}>Props</TabButton>
      <TabButton onSelect={() => handleSelect('state')}>State</TabButton>
    </menu>
  );
}
```

We will have more examples in [useState](./11_useState.md)