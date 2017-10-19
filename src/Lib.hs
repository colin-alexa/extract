module Lib
    ( extract
    , delimPredicate
    ) where

import           Data.ByteString (ByteString)
import           Data.Attoparsec.ByteString (takeWhile)
import           System.IO.Streams

type SPred = ByteString -> Bool
extract :: SPred -> SPred -> ByteString -> ByteString
extract = undefined


delimPredicate :: Bool -> String -> SPred
delimPredicate b = undefined
