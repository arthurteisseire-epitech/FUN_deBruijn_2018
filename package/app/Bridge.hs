module Bridge
    ( dispatch
    , generateDeBruijn
    ) where

import Check
import Generate

dispatch = [ ("--check", checkDeBruijn) ]

generateDeBruijn :: Int -> String -> IO ()
generateDeBruijn n a = putStrLn $ generate n a

checkDeBruijn :: Int -> String -> IO ()
checkDeBruijn n a = do
    l <- getLine
    if check n a l
    then putStrLn "OK"
    else putStrLn "KO"

