# Hook: useState

> [!Warning] Don't overuse
> One of the commonmistake in React apps, new developers over use the state. This makes app difficult to manage. A golden rule:
>
> Calculate more, use state less. If we can calculate some value from existing states, we should do that.


Example

```jsx
import { useState } from 'react';

function MyButton() {
    const [count, setCount] = useState(0);

    function handleClick() {
        setCount(count + 1);
    }

    return (
        <button onClick={handleClick}>
            Clicked {count} times
        </button>
    );
}
```

This show the use of state but it is restricted to the same component. There are times when we need to share state between multiple components. In thsoe cases, we promote the state to some common parent component

```jsx
import { useState } from 'react';

export default function MyApp() {
    const [count, setCount] = useState(0);

    function handleClick() {
        setCount(count + 1);
    }

    return (
        <div>
            <h1>Counters that update together</h1>
            <MyButton count={count} onClick={handleClick} />
            <MyButton count={count} onClick={handleClick} />
        </div>
    );
}

function MyButton({ count, onClick }) {
    return (
        <button onClick={onClick}>
            Clicked {count} times
        </button>
    );
}
```

## Updating Array or Object (Reference value) in stage

Below is a quick example of Tic-Tac-Toe board.

Here, we need to update the board, but simple update will not work. We need to make a copu of it, update it, and return

```JSX
import { useState } from "react";

const initialGameBoard = [
  [null, null, null],
  [null, null, null],
  [null, null, null],
];

export default function GameBoard() {
  const [gameBoard, setGameBoard] = useState(initialGameBoard);

  function handleSelectSquare(rowIndex, colIndex) {
    setGameBoard((prevGameBoard) => {
      // This is not recommended. Don't update current state directly.
      // prevGameBoard[rowIndex][colIndex] = 'X';
      // return prevGameBoard;

      // Correct way
      // Make copy
      const updatedBoard = [...prevGameBoard.map(innerArray => [...innerArray])];

      // update
      updatedBoard[rowIndex][colIndex] = 'X';

      // return
      return updatedBoard;
    });
  }

  return(
    <ol id="game-board">
      {gameBoard.map((row, rowIndex) => (
        <li key={rowIndex}>
          <ol>
            {row.map((playerSymbol, colIndex) => (
              <li key={colIndex}>
                <button onClick={() => handleSelectSquare(rowIndex, colIndex)}>{playerSymbol}</button>
              </li>
            ))}
          </ol>
        </li>
      ))}
    </ol>
  );
}

```

## Lifting state up

When parent component need to know the state, set or managed in child component.
