module Main where

import Generate
import Check
import System.Environment
import Data.Maybe

main :: IO ()
main = do
    args <- getArgs
    n <- fmap (read . head) getArgs
    case lookup (last args) dispatch of
        Just action -> exec n (init args) action
        Nothing -> exec n args generateDeBruijn

exec :: Int -> [String] -> (Int -> String -> IO ()) -> IO ()
exec n args action
    | length args == 2 = action n (args !! 1)
    | otherwise = action n "01"

dispatch = [ ("--check", checkDeBruijn) ]

generateDeBruijn :: Int -> String -> IO ()
generateDeBruijn n a = do
    putStrLn $ generate n a

checkDeBruijn :: Int -> String -> IO ()
checkDeBruijn n a = do
    l <- getLine
    if check n a l
    then putStrLn "OK"
    else putStrLn "KO"

