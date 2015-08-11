/* global exports */
"use strict";

// module Foreign.Context

var context;
try {
  context = Function('return this')() || (null, eval)('this');
}
catch(e) {
  context = window;
}

exports.getContext = function() {
  return context;
}
