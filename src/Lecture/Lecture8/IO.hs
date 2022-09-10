module Lecture.Lecture8.IO where

-- Combining IO
-- (>>) :: IO a -> IO b -> IO b
-- (>>=) :: IO a -> (a -> IO b) -> IO b

-- Record Syntax
-- data D = C T1 T2 T3

-- data D = C { field1 :: T1, field2 :: T2, field3 :: T3 }

main :: IO ()
main = putStrLn "Please enter a number: " >> (readLn >>= (\n -> putStrLn (show (n+1))))

