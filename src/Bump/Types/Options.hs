module Bump.Types.Options where

import RIO

import Bump.Types.Increment

data Options = Options
    { optionsVerbose   :: !Bool
    , optionsIncrement :: !Increment
    }
