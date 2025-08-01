# Context

The React Context API is a powerful tool for managing state and sharing data across components without the need for prop drilling. It allows you to create a global state that can be accessed by any component in the component tree, making state management more efficient and organized.

## Key Concepts of Context API

- Context: A container for the global state, created using React.createContext().
- Provider: A component that wraps part of the component tree and provides the context value to its descendants.
- Consumer: A way for components to access the context value, typically done using the useContext hook.

## Example: Counter Application

> [!important]
> This example used the code as in React 18. It will works same in react 19 as well, but there is an easier way to use it in react 19.

### Step 1: Create a Context

Create a file CounterContext.js to define the context and its provider.

```JSX
import React, { createContext, useState } from 'react';

const CounterContext = createContext();

const CounterProvider = ({ children }) => {
  const [count, setCount] = useState(0);

  return (
    <CounterContext.Provider value={{ count, setCount }}>
      {children}
    </CounterContext.Provider>
  );
};

export { CounterContext, CounterProvider };
```

### Step 2: Wrap the Application with the Provider

Wrap your application with the CounterProvider in the root component (e.g., App.js).

```JSX
import React from 'react';
import { CounterProvider } from './CounterContext';
import CounterDisplay from './CounterDisplay';

const App = () => {
  return (
    <CounterProvider>
      <div>
        <h1>React Context API Example</h1>
        <CounterDisplay />
      </div>
    </CounterProvider>
  );
};

export default App;
```

### Step 3: Consume the Context in a Component

Use the useContext hook to access the context in a child component.

```JSX
import React, { useContext } from 'react';
import { CounterContext } from './CounterContext';

const CounterDisplay = () => {
  const { count, setCount } = useContext(CounterContext);

  return (
    <div>
      <h2>Count: {count}</h2>
      <button onClick={() => setCount(count + 1)}>Increase Count</button>
    </div>
  );
};

export default CounterDisplay;
```

### How It Works

- The CounterProvider wraps the component tree and provides the count and setCount values.
- The CounterDisplay component consumes the context using useContext to display and update the count.

## Benefits of Context API

- Eliminates the need for prop drilling.
- Simplifies state management for medium-sized applications.
- Provides a clean and maintainable code structure.

This example demonstrates how the Context API can be used to manage global state efficiently, making it a great choice for scenarios like authentication, theme management, or sharing data across deeply nested components.