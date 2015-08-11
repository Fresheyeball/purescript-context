module Foreign.Context where

import Control.Monad.Eff

foreign import data Context :: *

foreign import getContext :: forall e. Eff e Context
