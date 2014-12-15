module Main where

import Context
import Test.Mocha
import Test.Chai
import Data.Foreign.OOFFI(getter)
import Control.Monad.Eff

murf               = "murf"
foreign import attachMurfToContext """
  var murf = "murf";
  var attachMurfToContext = null;
  try{
    window[murf] = murf;
    console.log("context is window");
  }catch(e){
    try{
      global[murf] = murf;
      console.log("context is global");
    }catch(e){
      self[murf] = murf;
      console.log("context is self");
    }
  }
""" :: Unit

getMurf :: forall e. Context -> Eff e String
getMurf = getter murf 

main = describe "Context" <<< it murf 
     $ getContext >>= getMurf >>= \murf' -> expect murf' `toEqual` murf
