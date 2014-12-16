# Purescript Context

[![Build Status](https://travis-ci.org/Fresheyeball/purescript-context.svg)](https://travis-ci.org/Fresheyeball/purescript-context)
[![Bower version](https://badge.fury.io/bo/purescript-context.svg)](http://badge.fury.io/bo/purescript-context)
[![Dependency Status](https://www.versioneye.com/user/projects/5490a602dd709d3ee2000143/badge.svg?style=flat)](https://www.versioneye.com/user/projects/5490a602dd709d3ee2000143)

This is a tiny purescript package to get you the Global JavaScript Context.
It exposes one value, which is `context`.

 - In a Browser   `context == window`
 - In Node.js     `context == global`
 - In a WebWorker `context == self`

