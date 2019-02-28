module Main where

import System.Environment
import System.Exit
import Data.Char
import Data.Maybe
import Bridge

main :: IO ()
main = do
    args <- getArgs
    if areArgsValid args == False
    then exitWithHelp
    else case lookup (last args) dispatch of
        Just action -> exec (read (head args)::Int) (init args) action
        Nothing -> exec (read (head args)::Int) args generateDeBruijn

exec :: Int -> [String] -> (Int -> String -> IO ()) -> IO ()
exec n args action
    | n == 0 = exitWithHelp
    | length args == 2 && isAlphabetValid (args !! 1) == False = exitWithHelp
    | length args == 2 = action n (args !! 1)
    | otherwise = action n "01"

isAlphabetValid [] = False
isAlphabetValid (x:xs)
    | xs == [] = True
    | x `elem` xs = False
    | otherwise = isAlphabetValid xs


areArgsValid args
    | length args > 3 = False
    | length args == 3 && (args !! 2) == "" = False
    | length args == 0 = False
    | otherwise = isInt (head args)

isInt [] = False
isInt (x:xs)
    | xs == [] = True
    | isDigit x == False = False
    | otherwise = isInt xs

exitWithHelp = do
    putStrLn "USAGE: ./deBruijn n [a] [--check|--unique|--clean]\n\n\t\
                     \--check\t\tcheck if a sequence is a de Bruijn sequence\n\t\
                     \--unique\tcheck if 2 sequences are distinct de Bruijn sequences\n\t\
                     \--clean\t\tlist cleaning\n\t\
                     \n\t\torder of the sequence\n\t\
                     \a\t\talphabet [def: \"01\"]"
    exitWith (ExitFailure 84)
