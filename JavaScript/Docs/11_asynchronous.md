# Asynchronous JS

JavaScript mostly follows a single thread model.

> We can have multiple threads but that is a topic for some other note.

This is both good and bad. One disadvantage of single thread model is, we can't write a code that waits for some other task to finish in the main thread. This will slow down the main thread.

To deal with this, we have asynchronous behaviour in JS. This can be achieved by in three ways

- Callback
- Promises
- Async...await