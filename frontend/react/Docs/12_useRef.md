# Hook: useRef

The useRef hook in React is a powerful tool that allows you to create a mutable reference object that persists across renders. It is commonly used for directly accessing DOM elements or storing mutable values that do not trigger re-renders when updated.

> Ref is just a value like as state, and value hold by let or const. However, it is special kind of value, managed by React

### Key Features of useRef
- Mutable Reference: The useRef hook returns an object with a current property that can hold any value.
- No Re-renders: Updating the current property does not cause the component to re-render.
- DOM Manipulation: It is often used to directly interact with DOM elements.

## common usecases

= `useRef` is not reactive, meaning changes to the current property do not trigger re-renders.
- It is ideal for cases where you need to interact with the DOM or store mutable values that don't affect the UI.

### 1. Accessing DOM Elements

> [!Important] Don't overuse it
> React allow us to directly work (& manipulate) DOM through Ref. However, ideally react should be ineracting with DOM. We should minimize directly manipulation the DOM, as it may have unexpected behavior.

```JSX
import React, { useRef } from 'react';

export default function FocusInput() {
  const inputRef = useRef(null);

  const handleFocus = () => {
    inputRef.current.focus(); // Focuses the input element
  };

  return (
    <>
      <input type="text" ref={inputRef} />
      <button onClick={handleFocus}>Focus Input</button>
    </>
  );
}
```

### 2. Storing Mutable Values

```JSX
import React, { useRef, useState } from 'react';

function Timer() {
  const count = useRef(0);
  const [render, setRender] = useState(0);

  const increment = () => {
    count.current += 1; // Updates the ref value
    console.log(`Count: ${count.current}`);
  };

  return (
    <>
      <button onClick={increment}>Increment</button>
      <button onClick={() => setRender(render + 1)}>Re-render</button>
    </>
  );
}

export default Timer;
```

### 3. Preserving Values Across Renders

```JSX
import React, { useRef, useEffect, useState } from 'react';

function PreviousValue() {
  const [value, setValue] = useState('');
  const prevValue = useRef('');

  useEffect(() => {
    prevValue.current = value; // Update ref after render
  });

  return (
    <>
      <input
        type="text"
        value={value}
        onChange={(e) => setValue(e.target.value)}
      />
      <p>Current Value: {value}</p>
      <p>Previous Value: {prevValue.current}</p>
    </>
  );
}

export default PreviousValue;
```

## Difference between Ref and State

| State | Ref |
|-------|-----|
| Cause Component reevalution | Don't re-evaluate component |
| Should be used for the values direcylt reflected in UI | Get's direct access to DOM Element |
| Available in first render | If there is no default value, not available on first render |
