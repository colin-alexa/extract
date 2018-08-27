module Lib
    ( takeSomeIO
    , dropSomeIO
    ) where

import System.IO (getLine, isEOF)


takeSomeIO :: (String -> Bool) -> (String -> Bool) -> IO ()
takeSomeIO takePred dropPred = do
  end <- isEOF
  if end
    then return ()
    else do
      line <- getLine
      if dropPred line
        then dropSomeIO takePred dropPred
        else putStrLn line >> takeSomeIO takePred dropPred

dropSomeIO :: (String -> Bool) -> (String -> Bool) -> IO ()
dropSomeIO takePred dropPred = do
  end <- isEOF
  if end
    then return ()
    else do
      line <- getLine
      if takePred line
        then putStrLn line >> takeSomeIO takePred dropPred
        else dropSomeIO takePred dropPred
