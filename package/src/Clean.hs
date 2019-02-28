module Clean
    ( clean
    ) where

import Check
import Unique

clean n a array = [line | line <- array, check n a line, isLineUnique n line array]

isLineUnique _ _ [] = True
isLineUnique n line (x:xs)
    | isUnique n line x = isLineUnique n line xs
    | otherwise = False
