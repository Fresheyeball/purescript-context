module Main where

import Context
import Test.Mocha
import Test.Chai

foreign import murf """
  try{
    window.murf = "murf";
    console.log("context is window");
  }catch(e){
    try{
      global.murf = "murf";
      console.log("context is global");
    }catch(e){
      self.murf = "murf";
      console.log("context is self");
    }
  }
""" :: Unit

main = describe "Context" <<< it "murf"
     $ expect context.murf `toEqual` "murf"
