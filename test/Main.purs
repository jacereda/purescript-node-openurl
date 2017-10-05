module Test.Main where

import Prelude

import Control.Monad.Eff (Eff)
import Node.ChildProcess (CHILD_PROCESS)
import Node.OpenURL (openURL)

main :: forall e. Eff (cp :: CHILD_PROCESS | e) Unit
main = openURL "http://www.google.com"
