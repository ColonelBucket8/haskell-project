module Lecture.Lecture8.RemoveTodo where

import System.IO
import System.Directory
import Data.List

main :: IO ()
main = do
    putStrLn "Enter a file path: "
    filePath <- getLine 
    handle <- openFile filePath ReadMode
    -- openTempFile :: FilePath  -- Directory in which to create the file
    --              -> String    -- File name template
    --              -> IO (FilePath, Handle)
    (tempName, tempHandle) <- openTempFile "." "temp"
    contents <- hGetContents handle
    let todoTasks = lines contents
        numberedTasks = zipWith (\n line -> show n ++ "-" ++ line) [0..] todoTasks
    putStrLn "There are your TO-DO items:"
    putStr $ unlines numberedTasks
    putStrLn "Which one do you want to delete?"
    numberString <- getLine
    let number = read numberString
        -- delete x removes the first occurence of x from its list argument
        -- delete :: Eq a => a -> [a] -> [a]
        newTodoItems = delete (todoTasks !! number) todoTasks
    hPutStr tempHandle $ unlines newTodoItems
    hClose handle 
    hClose tempHandle
    removeFile filePath
    renameFile tempName filePath
    putStrLn filePath

