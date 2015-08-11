## Module Foreign.Context

#### `Context`

``` purescript
data Context :: *
```

#### `getContext`

``` purescript
getContext :: forall e. Eff e Context
```

In a browser
`getContext >>= \context -> context == window`
In Node.js
`getContext >>= \context -> context == global`
In a WebWorker
`getContext >>= \context -> context == self`


