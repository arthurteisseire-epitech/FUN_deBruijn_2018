module Unique
    ( unique
    , isUnique
    ) where

import Data.List
import Check

unique n a input1 input2
    | check n a input1 == False = False
    | check n a input2 == False = False
    | otherwise = isUnique n input1 input2

isUnique n input1 input2 = case findSubstring (take n input1) (input2 ++ take (n - 1) input2) of
    Nothing -> True
    Just index -> checkDiffer input1 (splitAt index input2)

checkDiffer input1 (a, b) = b ++ a /= input1

findSubstring substr str = findIndex (isPrefixOf substr) (tails str)
