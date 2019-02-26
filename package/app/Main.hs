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
    else printDeBruijn n (args !! 1) (args !! 2)

getIntArg :: IO Int
getIntArg = fmap (read . head) getArgs

printDeBruijn :: Int -> String -> String -> IO ()
printDeBruijn n a "--check" = do
    l <- getLine
    if check n a l == True then putStrLn "OK" else putStrLn "KO"
