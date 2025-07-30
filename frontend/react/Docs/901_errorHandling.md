# Error handling

## String mode

StrictMode is a react component used to identify the potential issues and bug in the react code. It provides warning and alerts after running a check on complete code. Its goal is to improve the quality of the react apps by avoiding the common mistakes in the development.

It provides visual feedback (warning/error messages) whenever the React guidelines and recommended practices are not followed.

### Key Features of StrictMode:

- **Identifies Unsafe Lifecycles:** Warns about the use of deprecated lifecycle methods.
- **Detects Side Effects:** Helps identify unexpected side effects by invoking certain functions (like componentDidMount and componentDidUpdate) twice in development mode.
- **Warns About Legacy APIs:** Flags the usage of outdated React APIs.
- **Ensures Best Practices:** Encourages adherence to modern React patterns and practices.

#### Notes:
- StrictMode is development-only and has no impact on the production build.
- It is highly recommended for new projects to ensure long-term maintainability and compatibility with React's evolving ecosystem.

### Example usage

```JSX
import { StrictMode } from 'react';
import ReactDOM from 'react-dom/client';

import App from './App.jsx';
import './index.css';

ReactDOM.createRoot(document.getElementById('root')).render(
  <StrictMode>
    <App />
  </StrictMode>
);
```