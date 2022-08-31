module Lecture.Lecture8.InputAndOutput where
     
import Data.Char
import System.IO

-- Hello world
main :: IO ()
main = do
    putStrLn "Hello world!"
    -- Read input
    putStrLn "Hello, what's your name?"
    name <- getLine
    putStrLn $ "Hey " ++ name ++ ", you rock"
    -- Let bindings 
    putStrLn "What's your first name?"
    firstName <- getLine
    putStrLn "What's your last name?"
    lastName <- getLine
    let bigFirstName = map toUpper firstName
        bigLastName = map toUpper lastName
    putStrLn $ "Hey " ++ bigFirstName ++ " " ++ bigLastName ++ ", how are you?"
    -- Sequence
    a <- getLine
    b <- getLine
    c <- getLine
    -- Same as
    print [a,b,c]
    rs <- sequence [getLine, getLine, getLine]
    print rs
    -- return result
    mapM print [1,2,3]
    -- discard result
    mapM_ print [1,2,3]
    -- handle IO
    handle <- openFile "girlfriend.txt" ReadMode
    contents <- hGetContents handle
    putStr contents
    hClose handle
    -- withFile
    withFile "girlfriend.txt" ReadMode (\handle -> do
        contetns <- hGetContents handle
        putStr contents
        )
    -- readFile
    contents <- readFile "girlfriend.txt"
    putStr contents
    -- writeFile
    contents <- readFile "girlfriend.txt"
    writeFile "girlfriendcaps.txt" (map toUpper contents)


-- putStr :: String -> IO ()
-- putStr [] = return ()
-- putStr (x:xs) = do
--     putChar x
--     putStr xs
            
-- print = putStrLn . show
-- type FilePath = String
-- data IOMode = ReadMode | WriteMode | AppendMode | ReadWriteMode
-- withFile :: FilePath -> IOMode -> (Handle -> IO a) -> IO a

withFile' :: FilePath -> IOMode -> (Handle -> IO a) -> IO a
withFile' path mode f = do
        handle <- openFile path mode
        result <- f handle
        hClose handle
        return result

