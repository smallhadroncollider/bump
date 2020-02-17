module Bump.Parsers.BumpFile where

import RIO

import qualified Data.Bifunctor as BF (first)

import Data.Attoparsec.Text hiding (parse)

import Bump.Parsers.Utility (lexeme)
import Bump.Types.Files

linesP :: Parser [Int]
linesP = skipSpace *> char '[' *> decimal `sepBy` (lexeme $ char ',') <* char ']'

pathP :: Parser Text
pathP = lexeme $ takeTill (== ':') <* char ':'

entryP :: Parser File
entryP = File <$> pathP <*> linesP

bumpFileP :: Parser Files
bumpFileP = (lexeme $ entryP `sepBy1` endOfLine) <* endOfInput

-- parse
parse :: Text -> Either Text Files
parse txt = BF.first (const "Could not parse file.") (parseOnly bumpFileP txt)
