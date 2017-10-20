module Main where

import Lib
import System.Environment (getArgs)
import System.Exit (exitFailure)
import Data.List (isPrefixOf)

main :: IO ()
main = do
  [showDelim, hideDelim] <- getArgs >>= parseArgs
  dropSomeIO (showDelim `isPrefixOf`) (hideDelim `isPrefixOf`)

parseArgs ("--help":_) = putStrLn "extract <show-delim> <hide-delim>" >> exitFailure
parseArgs ("-h":_)     = parseArgs ["--help"]
parseArgs []           = parseArgs ["--help"]
parseArgs (x:y:z:_)    = parseArgs ["--help"]
parseArgs xs = return xs
