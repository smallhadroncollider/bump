{-# LANGUAGE TemplateHaskell #-}

module Bump.Parsers.BumpFileTest
    ( test_bump_file
    ) where

import           RIO
import qualified RIO.Text as T

import Test.Tasty
import Test.Tasty.HUnit

import Data.FileEmbed (embedFile)

import Bump.Parsers.BumpFile
import Bump.Types.Files

testData :: Text
testData = T.decodeUtf8With T.lenientDecode $(embedFile "test/data/.bump")

-- tests
test_bump_file :: TestTree
test_bump_file =
    testGroup
        "BumpFile"
        [ testCase
              "single line"
              (assertEqual
                   "Returns README.txt, line 9"
                   (Right [File "README.txt" [9]])
                   (parse "README.txt: [9]"))
        , testCase
              "multi line"
              (assertEqual
                   "Returns both files"
                   (Right [File "README.txt" [9], File "package.yaml" [2, 3]])
                   (parse "README.txt: [9]\npackage.yaml: [2, 3]"))
        , testCase
              "file"
              (assertEqual
                   "Returns both files"
                   (Right [File "blah.txt" [1, 2], File "README.md" [3]])
                   (parse testData))
        ]
