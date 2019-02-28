module Unique
    ( unique
    ) where

import Data.List
import Check

unique n a input1 input2
    | check n a input1 == False = False
    | check n a input2 == False = False
    | otherwise = isUnique n input1 input2

isUnique n input1 input2
    | input1 == input2 = False
    | otherwise = splitAndCheck n input1 input2

splitAndCheck n input1 input2 = case findIndex (`elem` (take n input1)) input2 of
    Nothing -> True
    Just index -> checkSame input1 (splitAt index input2)

checkSame input1 (a, b) = b ++ a == input1
