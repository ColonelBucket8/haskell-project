module Lecture.Lecture8.LessThan where

main :: IO ()
main = do
        contents <- getContents
        putStr $ shortLinesOnly'' contents 

shortLinesOnly :: String -> String
shortLinesOnly input = 
        let allLines = lines input
            shortLines = filter (\x -> length x < 10) allLines
            result = unlines shortLines
        in  result

-- Using function composition
shortLinesOnly' :: String -> String
shortLinesOnly' = unlines . filter (\x -> length x < 10) . lines

-- Shorter
shortLinesOnly'' :: String -> String
shortLinesOnly'' = unlines .filter ((<10) . length) . lines
