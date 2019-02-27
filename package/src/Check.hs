module Check
    ( check
    ) where

check n a input
    | length a ^ n == length input =  True
    | otherwise = False
