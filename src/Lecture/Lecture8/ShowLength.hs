module Lecture.Lecture8.ShowLength where

import System.Environment
import System.IO
import System.Directory

main :: IO ()
main = do
    -- (fileName:_) <- getArgs
    -- contents <- readFile fileName
    -- putStrLn $ "The file has " ++ show ( length $ lines contents ) ++ " lines!"
    -- With doesFileExist
    -- doesFileExist :: FilePath -> IO Bool
    (fileName:_) <- getArgs
    fileExists <- doesFileExist fileName
    if fileExists 
        then do contents <- readFile fileName
                putStrLn $ "The file has " ++ show ( length $ lines contents ) ++ " lines!"
        else do putStrLn "The file doesn't exists!"
              

