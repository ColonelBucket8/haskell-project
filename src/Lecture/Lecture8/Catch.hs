module Lecture.Lecture8.Catch where

import System.Environment
import System.IO
import System.IO.Error
import Control.Exception

main = toTry `catch` handler''

toTry :: IO ()
toTry = do
    (fileName:_) <- getArgs
    contents <- readFile fileName
    putStrLn $ "The file has " ++ show (length $ lines contents) ++ " lines!"

handler :: IOError -> IO ()
handler error = putStrLn "Whoops, had some trouble!"
    
-- Better error handler 
handler' :: IOError -> IO ()
handler' error
    | isDoesNotExistError error = putStrLn "The file doesn't exist!"
    | otherwise = ioError error

handler'' :: IOError -> IO ()
handler'' error
    | isDoesNotExistError error =
        case ioeGetFileName error of 
                 Just path -> putStrLn $ "Whoops! File does not extst at: " ++ path
                 Nothing -> putStrLn "Whoops! Files does not exist at unknown location!"
        | otherwise = ioError error
                                     
