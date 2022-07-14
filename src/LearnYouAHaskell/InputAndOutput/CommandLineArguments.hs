module LearnYouAHaskell.InputAndOutput.CommandLineArguments where

import System.Environment
import System.Directory
import System.IO
import Data.List

-- get arguments
-- main = do
--     args <- getArgs
--     programName <- getProgName
--     putStrLn "The arguments are:"
--     mapM putStrLn args
--     putStrLn "The program name is:"
--     putStrLn programName

-- returns new array without indexed element
deleteAt :: Int -> [x] -> [x]
deleteAt index xs = leftArray ++ rightArray 
    where (leftArray, (_:rightArray)) = splitAt index xs

bumpToTop :: Int -> [x] -> [x]
bumpToTop index xs = elementToBump : leftArray ++ rightArray
    where (leftArray, (elementToBump:rightArray)) = splitAt index xs

-- >>> lookup 2 []
-- Nothing
-- >>> lookup 2 [(1, "first")]
-- Nothing
-- >>> lookup 2 [(1, "first"), (2, "second"), (3, "third")]
-- Just "second"
main = do
    (command:args) <- getArgs
    let (Just action) = lookup command dispatch
    action args

dispatch :: [(String, [String] -> IO ())] 
dispatch = [ ("add", add)
           , ("view", view)
           , ("remove", remove)
           ]

add :: [String] -> IO ()
add [fileName, todoItem] = appendFile fileName (todoItem ++ "\n")

view :: [String] -> IO ()
view [fileName] = do
    contents <- readFile fileName
    let todoTasks = lines contents
        numberedTasks = zipWith (\n line -> show n ++ " - " ++ line) [0..] todoTasks
    putStr $ unlines numberedTasks   

remove :: [String] -> IO ()
remove [fileName, numberString] = do
    handle <- openFile fileName ReadMode
    (tempName, tempHandle) <- openTempFile "." "temp"
    contents <- hGetContents handle
    let number = read numberString
        todoTasks = lines contents
        -- newTodoItems = delete (todoTasks !! number) todoTasks
        newTodoItems = deleteAt number todoTasks
    hPutStr tempHandle $ unlines $ deleteAt number todoTasks
    hClose handle
    hClose tempHandle
    removeFile fileName
    renameFile tempName fileName

bump :: [String] -> IO ()
bump [fileName, numberString] = do
    handle <- openFile fileName ReadMode
    (tempName, tempHandle) <- openTempFile "." "temp"
    contents <- hGetContents handle
    let number = read numberString
        todoTasks = lines contents
        newTodoItems = bumpToTop number todoTasks
    hPutStr tempHandle $ unlines newTodoItems
    hClose handle
    hClose tempHandle
    removeFile fileName
    renameFile tempName fileName
