module Context where

foreign import context """
  var context;
  try {
    context = Function('return this')() || (42, eval)('this');
  } catch(e) {
    context = window;
  }
""" :: forall e. { | e}
