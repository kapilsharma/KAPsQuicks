# Components

> React component is a JS function that return markup

- Two rules for Component
  - Name of react component starts with Capital letter
    - This is important to separate it with HTML tahe, which are in lower case.
    - Components are generally in separate js file, and must export function defining component.
    - It returns a markup, written in [JSX (JavaScript XML)](03_jsx.md)
  - It must return JSX

## Displaying variables in JSX

```JSX
const reactDescriptions = ['Fundamental', 'Crucial', 'Core'];

function genRandomInt(max) {
  return Math.floor(Math.random() * (max + 1));
}

function Header() {
const description= reactDescriptions[genRandomInt(2)];

  return (
    <header>
      <img src="src/assets/react-core-concepts.png" alt="Stylized atom" />
      <h1>React Essentials</h1>
      <p>
        {description} React concepts you will need for almost any app you are
        going to build!
      </p>
    </header>
  );
}
```

In above example, we used `{description}`. This is how we add dynamic contents in a Component's JSX.

- It can display any varialbe or expression (like 1 + 1)
- It can not have any block statement like loops, decision, function body, etc.

## Props (Properties)

Properties (Call as Props) are like function parameters or like HTML attributes.

Better way to define them is, they are custom attributes to our custom tag (Components)

> tag:attribute = Component:props

In Component, we get single parameter, generally named `props` (but we can name it anything). It is the object of all passed props. We can use them as `props.prop` as in following example.

```JSX
function CoreConcept(props) {
  return (
    <li>
      <img src={props.image} alt={props.title} />
      <h3>{props.title}</h3>
      <p>{props.description}</p>
    </li>
  );
}

function App() {
  return (
    <ul>
      <CoreConcepts
        title="Some title"
        description="Some Description"
        image={ImgPath}
      />
    </ul>
  );
}
```

### Props short cut

If we have proprties stored in an array, we can use a shortcut to set them, using spread operator. Assume we have an array CORE_CONCEPTS as

```JS
CORE_CONCEPTS = [
  {
    image: 'some_image.png',
    title: 'Some Title',
    description: 'Some Description'
  }
]
```

We can pass whole object, instead of extracting it individually.

```JSX
function App() {
  return (
    <ul>
      <CoreConcept {...CORE_CONCEPT[0]} />
    </ul>
  );
}
```

This will extract all key-value pare of the the JS object and set them as props

### Object destructuring in Component's props

We can use JavaScript's [destructure](../../../JavaScript/Docs/O2_destructure.md) while accepting props in the component.

```JSX
function CoreConcept({image, title, description}) {
  return (
    <li>
      <img src={image} alt={title} />
      <h3>{title}</h3>
      <p>{description}</p>
    </li>
  );
}
```

### Children property / Component composition

Used to show the contents/child, when tab is used

```JSX
export default function TabButton(props) {
  return (
    <li><button>{props.children}</button></li>
  );
}
```

Now we can uswe that component as `<TabButton>Example Content</TabButton>` and it will show contents (Example Content) of above example.

We can also destructure children as

```JSX
export default function TabButton({children}) {
  return (
    <li><button>{children}</button></li>
  );
}
```

> Approach to wrap child, which may include other components as well, is called `Component Composition`.

### Remaining Properties

Sometimes, we may want to destructure few properties, but not all. In that case, after destructuring required properties, we can catch remaining properties as `...props`. It can be any name, we need not to keep it as props. It may be `...remainingProperty` or `...anything`. Example

```JSX
function Section({ title, children, ...props}) {
  return (
    <section {...props}>
      <h2>{title}</h2>
      {children}
    </section>
  );
}

function ParentComponent() {
  return (
    <Section title="Some title" id="someId">
      <p>This is the content (children)</p>
    </Section>
  );
}
```

In this example, we have not captured id property, but due to `...props`, it will be captured and applied to section.

### Two way binging

Requirements:

- We have to Make a Player component
- We should pass the name (initialName) and show it.
- With that, we have to show edit button.
- When edit button is pressed
  - Change button text to 'save'
  - Chane name label to input textbox.
- Save button should save the text.

> There is no two way binding like in angular. So we hve to mix prop and event to achieve that.

```JSX
import { useState } from "react";

function Player({ initialName, symbol}) {
  const [playerName, setPlayerName] = useState(initialName);
  const [ isEditing, setIsEditing ] = useState(false);

  function handleEditClick() {
    // We can't simply do 
    // setIsEditing(!editing)
    // It takes some to update, and we may not work on it immediately.
    // Following ensure it is updated immediately.
    setIsEditing(editing => !editing);
  }

  function handleChange(event) {
    setPlayerName(event.target.value);
  }

  let editablePlayerName = <span className="player-name">{playerName}</span>;
  if (isEditing) {
    editablePlayerName = <input type="text" required value={playerName} onChange={handleChange} />
  }

  return (
    <li>
      <span className="player">
        {editablePlayerName}
        <span className="player-symbol">{ symbol }</span>
      </span>
      <button onClick={handleEditClick}>{isEditing ? 'Save' : 'Edit'}</button>
    </li>
  );
}

function ParentComponent() {
  return(
    <ol id="players">
      <Player initialName="Player 1" symbol="X"/>
      <Player initialName="Player 2" symbol="O"/>
    </ol>
  );
}
```
