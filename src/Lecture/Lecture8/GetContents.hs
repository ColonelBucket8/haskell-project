module Lecture.Lecture8.GetContents where

import Data.Char

main :: IO ()
main = do
        contents <- getContents 
        putStrLn $ map toUpper contents


