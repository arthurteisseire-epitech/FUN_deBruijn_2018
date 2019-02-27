module Check
    ( check
    ) where

import Data.List

check n a input
    | onlyChars a input == False = False
    | length a ^ n == length input = isValid n a input
    | otherwise = False

isValid _ _ [] = True
isValid n a input
    | (take n input) `isInfixOf` (drop n input) = False
    | otherwise = isValid n a (drop n input)

onlyChars a [] = True
onlyChars a (x:xs)
    | x `elem` a = onlyChars a xs
    | otherwise = False
