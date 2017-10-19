module Main where

import Control.Monad (when)
import Data.List (isPrefixOf)
import System.IO (getLine, isEOF)
import System.Exit (exitSuccess)

main :: IO ()
main = extract "not ok" "ok"

extract :: String -> String -> IO ()
extract delim undelim = do
  end <- isEOF
  if end then
    exitSuccess
  else do
    line <- getLine
    when (delim `isPrefixOf` line) $
      putStrLn line >> extract' undelim delim

extract' :: String -> String -> IO ()
extract' undelim delim = do
  end <- isEOF
  if end then
    exitSuccess
  else do
    line <- getLine
    if delim `isPrefixOf` line then
      extract undelim delim
    else
      putStrLn line
