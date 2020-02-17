module Bump.Types.Files where

import RIO

data File = File
    { path  :: Text
    , lines :: [Int]
    } deriving (Eq, Show)

type Files = [File]
