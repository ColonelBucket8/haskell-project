module Lecture.Lecture8.Todo where

import System.IO
import System.Directory
import Data.List

main :: IO ()
main = do
        putStrLn "Enter a file path: "
        filePath <- getLine 
        handle <- openFile filePath ReadMode
        putStrLn filePath
