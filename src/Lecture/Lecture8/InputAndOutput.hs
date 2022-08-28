module Lecture.Lecture8.InputAndOutput where
     
import Data.Char

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

-- putStr :: String -> IO ()
-- putStr [] = return ()
-- putStr (x:xs) = do
--     putChar x
--     putStr xs
            
-- print = putStrLn . show

