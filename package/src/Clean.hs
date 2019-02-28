module Clean
    ( clean
    ) where

import Check
import Unique

clean n a array = filterUniqueLines n [line | line <- array, check n a line]

filterUniqueLines :: Int -> [String] -> [String]
filterUniqueLines _ [] = []
filterUniqueLines n (line:xs)
    | isLineUnique n line xs = line : (filterUniqueLines n xs)
    | otherwise = filterUniqueLines n xs

isLineUnique :: Int -> String -> [String] -> Bool
isLineUnique _ _ [] = True
isLineUnique n line (x:xs)
    | isUnique n line x = isLineUnique n line xs
    | otherwise = False
