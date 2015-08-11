module Foreign.Context where

import Control.Monad.Eff

foreign import data Context :: *

-- | In a browser
-- | `getContext >>= \context -> context == window`
-- | In Node.js
-- | `getContext >>= \context -> context == global`
-- | In a WebWorker
-- | `getContext >>= \context -> context == self`
foreign import getContext :: forall e. Eff e Context
