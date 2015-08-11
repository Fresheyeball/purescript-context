/* global exports */
"use strict";

// module Test.Main

var murf = "murf";
try {
  window[murf] =  murf;
  console.log("context is window");
}
catch(e) {
  try { 
    global[murf] = murf;
    console.log("context is global");
  }
  catch(e) {
    self[murf] = murf;
    console.log("context is self");
  }
}
exports.attachMurfToContext = null;

exports.getter = function(prop) {
  return function(context) {
    return function() {
      return context[prop];
    }
  }
}
