module Bump.Types.Increment where

import RIO
import Text.Read (readsPrec)

data Increment
    = Major
    | Minor
    | Patch
    deriving (Eq, Show)

instance Read Increment where
    readsPrec _ "major" = [(Major, "")]
    readsPrec _ "minor" = [(Minor, "")]
    readsPrec _ "patch" = [(Patch, "")]
    readsPrec _ _       = []
