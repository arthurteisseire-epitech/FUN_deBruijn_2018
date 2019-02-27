module Main where

import Generate
import Check
import System.Environment
import Data.Maybe

main :: IO ()
main = do
    args <- getArgs
    n <- getIntArg
    if (last args) `elem` flags
    then putStrLn $ exec n (init args) (fromJust $ lookup (last args) dispatch)
    else putStrLn $ exec n args generate

getIntArg :: IO Int
getIntArg = fmap (read . head) getArgs

exec :: Int -> [String] -> (Int -> String -> String) -> String
exec n args action
    | length args == 2 = action n (args !! 1)
    | otherwise = action n "01"

dispatch = [ ("--check", generate) ]

flags = ["--check", "--clean", "--unique"]

--checkDeBruijn :: Int -> String -> String -> IO ()
--checkDeBruijn n a "--check" = do
--    l <- getLine
--    if check n a l
--    then putStrLn "OK"
--    else putStrLn "KO"

