module Main where

import Generate
import Check
import System.Environment

main :: IO ()
main = do
    args <- getArgs
    n <- getIntArg
    if length args == 2
    then putStrLn (generate n (args !! 1))
    else putStrLn (printDeBruijn n (args !! 1) (args !! 2))

getIntArg :: IO Int
getIntArg = fmap (read . head) getArgs

printDeBruijn n a "--check" = check n a getLine
