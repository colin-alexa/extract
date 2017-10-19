module Main where

import Control.Monad (when)
import Data.List (isPrefixOf)
import System.IO (getLine, isEOF)
import System.Exit (exitSuccess)

main :: IO ()
main = do
  keptLines <- takeSome ("not ok" `isPrefixOf`) ("ok" `isPrefixOf`) <$> sequence getLines
  mapM_ putStrLn keptLines

takeSome _ _ []     = []
takeSome dPred uPred (x:xs) =
  if uPred x
    then dropSome dPred uPred xs
    else x : takeSome dPred uPred xs

dropSome _ _ []     = []
dropSome dPred uPred (x:xs) =
  if dPred x
    then x : takeSome dPred uPred xs
    else dropSome dPred uPred xs

getLines :: [IO String]
getLines = getLine : getLines
