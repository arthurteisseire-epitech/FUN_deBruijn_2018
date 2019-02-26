module Main where

import DeBruijn
import System.Environment

main :: IO ()
main = do
    args <- getArgs
    n <- getIntArg
    putStrLn (deBruijn n (args !! 1))

getIntArg :: IO Int
getIntArg = fmap (read . head) getArgs

