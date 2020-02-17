module Bump.Types.IncrementTest
    ( test_types
    ) where

import qualified RIO.Partial as RIO' (read)

import Test.Tasty
import Test.Tasty.HUnit

import Bump.Types.Increment (Increment (..))

-- tests
test_types :: TestTree
test_types =
    testGroup
        "Increment"
        [ testCase "major" (assertEqual "Returns major increment type" Major (RIO'.read "major"))
        , testCase "minor" (assertEqual "Returns minor increment type" Minor (RIO'.read "minor"))
        , testCase "patch" (assertEqual "Returns patch increment type" Patch (RIO'.read "patch"))
        ]
