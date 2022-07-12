module LearnYouAHaskell.InputAndOutput.FilesAndStreams where


import Control.Monad
import Data.List
import Data.Char
import System.IO
import System.Directory

-- main = forever $ do
--     putStr "Give me some input: "
--     input <- getLine
--     putStrLn $ map toUpper input

-- main = do
--     contents <- getContents
--     putStr (shortLinesOnly contents)

-- main = interact shortLinesOnly

-- main = interact $ unlines . filter ((<10) . length) . lines

-- main = interact respondPalindromes

-- openFile :: FilePath -> IOmode -> IO Handle
-- type Filepath = String
-- data IOMode = ReadMode | WriteMode | AppendMode | ReadWriteMode
-- main = do
--     handle <- openFile "girlfriend.txt" ReadMode
--     contents <- hGetContents handle
--     putStr contents
--     hClose handle

-- main = do
--     contents <- readFile "girlfriend.txt"
--     putStr contents

-- main = do
--     contents <- readFile "girlfriend.txt"
--     writeFile "girlfriendCaps.txt" $ map toUpper contents

-- appendFile
-- main = do
--     todoItem <- getLine
--     appendFile "todo.txt" (todoItem ++ "\n")

-- delete task
main = do
    handle <- openFile "todo.txt" ReadMode
    (tempName, tempHandle) <- openTempFile "." "temp"
    contents <- hGetContents handle
    let todoTasks = lines contents
        numberedTasks = zipWith (\n line -> show n ++ " - " ++ line) [0..] todoTasks
    putStrLn "These are your todo items:"
    -- mapM putStrLn numberedTasks
    putStr $ unlines numberedTasks
    putStrLn "Which one do you want to delete?"
    numberString <- getLine
    let number = read numberString
        newTodoItems = delete (todoTasks !! number) todoTasks
    hPutStr tempHandle $ unlines newTodoItems
    hClose handle
    hClose tempHandle
    removeFile "todo.txt"
    renameFile tempName "todo.txt"

shortLinesOnly :: String -> String
shortLinesOnly input =
    let allLines = lines input
        shortLines = filter (\line -> length line < 10) allLines
        result = unlines shortLines
    in  result

respondPalindromes :: [Char] -> [Char]
respondPalindromes = unlines . map (\xs -> if isPalindrome xs then "palindrome" else "not a palindrome") . lines
    where isPalindrome xs = xs == reverse xs

withFile' :: FilePath -> IOMode -> (Handle -> IO a) -> IO a
withFile' path mode f = do
    handle <- openFile path mode
    result <- f handle
    hClose handle
    return result
