module LearnYouAHaskell.InputAndOutput.Exceptions where

import System.Environment
import System.IO
import System.IO.Error
import System.Directory
import Control.Exception

-- main = do
--     (fileName:_) <- getArgs
--     -- doesFileExist :: FilePath -> IO bool
--     fileExists <- doesFileExist fileName
--     if fileExists
--        then do 
--             contents <- readFile fileName
--             putStrLn $ "The file named " ++ fileName ++ " has " ++ show (length (lines contents)) ++ " lines!"
--        else do 
--             putStrLn $ "The file " ++ fileName ++ " doesn't exists"

-- catch :: IO a -> (IOError -> IO a) -> IO a
main = toTry `catch` handler

toTry :: IO ()
toTry = do 
    (fileName:_) <- getArgs
    contents <- readFile fileName
    putStrLn $ "The file has " ++ show (length (lines contents)) ++ " lines!"

handler :: IOError -> IO ()
handler err 
    -- isDoesNotExistError :: IOError -> Bool
    | isDoesNotExistError err = 
        -- ioeGetFileName :: IOError -> Maybe FilePath
        case ioeGetFileName err of Just path -> putStrLn $ "Whoops! File does not exist at: " ++ path
                                   Nothing -> putStrLn "Whoops! File does not exist at unknown lcoation!"
    -- ioError :: IOException -> IO a
    | otherwise = ioError err

-- Can cover several of IO codes with catch and use diferent handlers
-- main = do 
--     toTry `catch` handler1
--     thenTryThis `catch` handler2
--     launchRockets
