module Main where

import DeBruijn
import System.Environment

main :: IO ()
main = do
    args <- getArgs
    n <- getIntArg
    if length args == 2 then putStrLn (deBruijn n (args !! 1)) else printDeBruijn n (args !! 1) (args !! 2)

getIntArg :: IO Int
getIntArg = fmap (read . head) getArgs

dispatch =  [ ("--check", deBruijn)
            , ("--unique", deBruijn)
            , ("--clean", deBruijn)
            ]


printDeBruijn n a "--check" = putStrLn (deBruijn n a)
