module Main where

import System.Environment
import System.Exit
import Data.Char
import Data.Maybe
import Bridge

main :: IO ()
main = do
    args <- getArgs
    if areArgsValid args == False then exitWith (ExitFailure 84)
    else case lookup (last args) dispatch of
        Just action -> exec (read (head args)::Int) (init args) action
        Nothing -> exec (read (head args)::Int) args generateDeBruijn

exec :: Int -> [String] -> (Int -> String -> IO ()) -> IO ()
exec n args action
    | isAlphabetValid (args !! 1) == False = exitWith (ExitFailure 84)
    | length args == 2 = action n (args !! 1)
    | otherwise = action n "01"

isAlphabetValid [] = False
isAlphabetValid (x:xs)
    | xs == [] = True
    | x `elem` xs = False
    | otherwise = isAlphabetValid xs


areArgsValid args
    | length args > 3 = False
    | length args == 0 = False
    | otherwise = isInt (head args)

isInt [] = True
isInt s
    | isDigit (head s) == False = False
    | otherwise = isInt $ tail s
