module Bump.Parsers.Utility where

import           RIO
import qualified RIO.Text as T

import Data.Attoparsec.Text

only :: Parser a -> Parser a
only p = p <* endOfInput

lexeme :: Parser a -> Parser a
lexeme p = skipSpace *> p <* skipSpace

line :: Parser Text
line = (takeTill isEndOfLine <* endOfLine) <|> takeText

word :: Parser Text
word = lexeme $ T.pack <$> many1 letter
