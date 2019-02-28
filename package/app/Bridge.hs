module Bridge
    ( dispatch
    , generateDeBruijn
    ) where

import System.Exit
import System.IO
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
    l <- handleGetLine
    if check n a l
    then putStrLn "OK"
    else putStrLn "KO"

uniqueBridge n a = do
    l1 <- handleGetLine
    l2 <- handleGetLine
    if unique n a l1 l2
    then putStrLn "OK"
    else putStrLn "KO"

cleanBridge n a = checkInputLines n a []

checkInputLines n a array = do
    l <- handleGetLine
    if l == "END"
    then mapM_ putStrLn $ reverse $ clean n a array
    else checkInputLines n a (l : array)

handleGetLine :: IO String
handleGetLine = do
    e <- isEOF
    if e
    then exitWith (ExitFailure 84)
    else getLine
