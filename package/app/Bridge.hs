module Bridge
    ( dispatch
    , generateDeBruijn
    ) where

import Generate
import Check
import Unique
import Clean

dispatch = [ ("--check", checkBridge)
           , ("--unique", uniqueBridge)
           , ("--clean", cleanBridge)
           ]

generateDeBruijn :: Int -> String -> IO ()
generateDeBruijn n a = putStrLn $ generate n a

checkBridge :: Int -> String -> IO ()
checkBridge n a = do
    l <- getLine
    if check n a l
    then putStrLn "OK"
    else putStrLn "KO"

uniqueBridge n a = do
    l1 <- getLine
    l2 <- getLine
    if unique n a l1 l2
    then putStrLn "OK"
    else putStrLn "KO"

cleanBridge n a = checkInputLines n a []

checkInputLines n a array = do
    l <- getLine
    if l == "END"
    then mapM_ putStrLn $ reverse $ clean n a array
    else checkInputLines n a (l : array)
