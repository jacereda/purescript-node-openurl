module Node.OpenURL where

import Prelude

import Effect (Effect)
import Data.Maybe (Maybe(..))
import Node.ChildProcess (defaultSpawnOptions, ignore, spawn)
import Node.Platform (Platform(..))
import Node.Process (platform)

openURL :: String -> Effect Unit
openURL url = void $ case platform of
    Just Win32 -> launch "start" ["/b", url]
    Just Darwin -> launch "open" [url]
    _ -> launch "xdg-open" [url]
  where launch cmd args = spawn cmd args opts
        opts = defaultSpawnOptions {detached = true, stdio = ignore}
