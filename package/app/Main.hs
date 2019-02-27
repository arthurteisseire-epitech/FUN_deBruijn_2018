module Main where

import System.Environment
import Data.Maybe
import Bridge

main :: IO ()
main = do
    args <- getArgs
    n <- fmap (read . head) getArgs
    case lookup (last args) dispatch of
        Just action -> exec n (init args) action
        Nothing -> exec n args generateDeBruijn

exec :: Int -> [String] -> (Int -> String -> IO ()) -> IO ()
exec n args action
    | length args == 2 = action n (args !! 1)
    | otherwise = action n "01"
