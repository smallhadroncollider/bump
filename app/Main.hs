{-# LANGUAGE TemplateHaskell #-}

module Main
    ( main
    ) where

import RIO
import RIO.Process

import Options.Applicative.Simple

import Bump       (run)
import Import
import Paths_bump (version)

main :: IO ()
main = do
    (options, ()) <-
        simpleOptions
            $(simpleVersion version)
            "bump"
            "Simple version bumping"
            (Options <$> switch (long "verbose" <> short 'v' <> help "Verbose output?") <*>
             argument auto (metavar "[major|minor|patch]"))
            empty
    lo <- logOptionsHandle stderr (optionsVerbose options)
    pc <- mkDefaultProcessContext
    withLogFunc lo $ \lf ->
        let app = App {appLogFunc = lf, appProcessContext = pc, appOptions = options}
        in runRIO app run
