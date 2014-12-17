module Main where

import Context
import Test.Mocha(describe, it)
import Test.Chai(expect, toEqual)
import Data.Foreign.OOFFI(getter)
import Control.Monad.Eff

murf                       = "murf"
foreign import attachMurfToContext """
  var murf                 = "murf",
      attachMurfToContext  =  null;
  try{        window[murf] =  murf; console.log("context is window"); }
  catch(e){
    try{      global[murf] =  murf; console.log("context is global"); }
    catch(e){ self  [murf] =  murf; console.log("context is self");   }
  }
""" :: Unit

main = describe "Context" <<< it murf 
     $ getContext >>= getter murf >>= \murf' -> expect murf' `toEqual` murf
