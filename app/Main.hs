module Main where

import           Lib
import qualified System.IO.Streams as S
import           System.IO.Streams.Handle (stdin, stdout)

main :: IO ()
main = do
  startDelim <- getArg "--start"
  endDelim <- getArg "--end"
  keepDelims <- argPresent "--keepDelims"
  stream <- S.read stdin

  let sPred = delimPredicate keepDelims <$> startDelim
  let ePred = delimPredicate keepDelims <$> endDelim

  S.write (extract <$> sPred <*> ePred <*> stream) stdout

getArg :: String -> IO (Maybe String)
getArg = undefined

argPresent :: String -> IO Bool
argPresent = undefined
