# Common CSS tricks

> This is a catch-all page of CSS tricks/notes, before we decide thecorrect page for it.

## Box-sizing

When using normal CSS, we can sommonly see

```CSS
* {
  box-sizing: border-box;
}
```

Defauly value of box-sizing is `content-box`. This means, width and height include only contents and excludes padding and border.

This may lead to some unexpected results.

A common solution is to set box-sizing to `border-box` universally. This includes padding and border in height and width property.