module Test.Main where

import Prelude

import Control.Monad.Aff          (Aff()) -- monadEffAff
import Control.Monad.Eff          (Eff())
import Control.Monad.Eff.Class    (liftEff)
import Test.Spec                  (describe, it)
import Test.Spec.Assertions       (shouldEqual)
import Test.Spec.Reporter.Console (consoleReporter)
import Test.Spec.Runner           (run)

import Foreign.Context

murf = "murf"
foreign import attachMurfToContext :: Unit
foreign import getter :: forall a eff. String -> Context -> Eff eff a

main = run [consoleReporter] do
  describe "getContext" do
    it "finds the correct context" do
      context <- affContext
      murf' <- getAff murf context
      murf' `shouldEqual` murf

affContext :: forall e. Aff e Context
affContext = liftEff (getContext :: Eff e Context)

getAff :: forall e. String -> Context -> Aff e String
getAff k c = liftEff $ (getter k c :: Eff e String)
