module Main where

import Generate
import Check
import System.Environment
import Data.Maybe

main :: IO ()
main = do
    args <- getArgs
    n <- fmap (read . head) getArgs
    case (lookup (last args) dispatch) of
        Nothing -> putStrLn $ exec n args generate
        Just x -> putStrLn $ exec n (init args) x

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

