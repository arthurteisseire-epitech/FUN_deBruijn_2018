module Main where

import Generate
import Check
import System.Environment
import Data.Maybe

main :: IO ()
main = do
    args <- getArgs
    n <- getIntArg
    case (lookup (last args) dispatch) of
        Nothing -> putStrLn $ exec n args generate
        Just x -> putStrLn $ exec n (init args) x

getIntArg :: IO Int
getIntArg = fmap (read . head) getArgs

exec :: Int -> [String] -> (Int -> String -> String) -> String
exec n args action
    | length args == 2 = action n (args !! 1)
    | otherwise = action n "01"

dispatch = [ ("--check", generate) ]

--checkDeBruijn :: Int -> String -> String -> IO ()
--checkDeBruijn n a "--check" = do
--    l <- getLine
--    if check n a l
--    then putStrLn "OK"
--    else putStrLn "KO"

