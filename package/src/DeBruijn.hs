module DeBruijn
    ( ini
    , deBruijn
    ) where

import Data.List
import Debug.Trace

deBruijn :: Int -> String -> String
deBruijn n a = getA n a (ini n a)

ini :: Int -> [Char] -> [Char]
ini n a = take n (repeat (head a))

getA :: Int -> String -> String -> String
getA _ [] seq = []
getA n a seq
    | getTail n a seq `isInfixOf` seq = getA n (init a) seq
    | otherwise = [last a]

getTail :: Int -> String -> String -> String
getTail n a seq = drop (length seq - n) seq ++ [last a]
