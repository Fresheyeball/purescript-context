module Context where

import Control.Monad.Eff

foreign import data Context :: *

foreign import getContext """
  var context;
  try      { context = Function('return this')() || (42, eval)('this'); } 
  catch(e) { context = window; }    
  function getContext(){ return context; }
""" :: forall e. Eff e Context
