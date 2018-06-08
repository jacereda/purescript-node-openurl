module Test.Main where

import Prelude

import Effect (Effect)
import Node.OpenURL (openURL)

main :: Effect Unit
main = openURL "http://www.google.com"
