# Purescript Context

[![Build Status](https://travis-ci.org/Fresheyeball/purescript-context.svg)](https://travis-ci.org/Fresheyeball/purescript-context)


This is a tiny purescript package to get you the Global JavaScript Context.
It exposes one value, which is `context`.

 - In a Browser   `context == window`
 - In Node.js     `context == global`
 - In a WebWorker `context == self`

