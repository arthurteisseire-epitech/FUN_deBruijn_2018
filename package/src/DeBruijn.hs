module DeBruijn
    ( deBruijn
    ) where

import Data.List

deBruijn :: Int -> String -> String
deBruijn n a = createSeq n a (take n (repeat (head a)))

createSeq :: Int -> String -> String -> String
createSeq n a seq
    | getA n a seq == [] = take (length seq - (n - 1)) seq
    | otherwise = createSeq n a (seq ++ getA n a seq)

getA :: Int -> String -> String -> String
getA _ [] seq = []
getA n a seq
    | getTail n a seq `isInfixOf` seq = getA n (init a) seq
    | otherwise = [last a]

getTail :: Int -> String -> String -> String
getTail n a seq = drop (length seq - (n - 1)) seq ++ [last a]
