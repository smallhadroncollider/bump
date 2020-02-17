module Bump.Types.App where

import RIO
import RIO.Process

import Bump.Types.Options

data App = App
    { appLogFunc        :: !LogFunc
    , appProcessContext :: !ProcessContext
    , appOptions        :: !Options
    }

instance HasLogFunc App where
    logFuncL = lens appLogFunc (\x y -> x {appLogFunc = y})

instance HasProcessContext App where
    processContextL = lens appProcessContext (\x y -> x {appProcessContext = y})
