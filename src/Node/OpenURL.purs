module Node.OpenURL where

import Prelude

import Control.Monad.Eff (Eff)
import Data.Maybe (Maybe(..))
import Node.ChildProcess (CHILD_PROCESS, defaultSpawnOptions, ignore, spawn)
import Node.Platform (Platform(..))
import Node.Process (platform)

openURL :: forall e. String -> Eff (cp :: CHILD_PROCESS | e) Unit
openURL url = void $ case platform of
    Just Win32 -> launch "start" ["/b", url]
    Just Darwin -> launch "open" [url]
    _ -> launch "xdg-open" [url]
  where launch cmd args = spawn cmd args opts
        opts = defaultSpawnOptions {detached = true, stdio = ignore}
