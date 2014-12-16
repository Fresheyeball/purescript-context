# Purescript Context

This is a tiny purescript package to get you the Global JavaScript Context.
It exposes one value, which is `context`.

 - In a Browser   `context == window`
 - In Node.js     `context == global`
 - In a WebWorker `context == self`

