module LearnYouAHaskell.InputAndOutput.FilesAndStreams where


import Control.Monad
import Data.Char

-- main = forever $ do
--     putStr "Give me some input: "
--     input <- getLine
--     putStrLn $ map toUpper input

main = do
    contents <- getContents
    putStr (shortLinesOnly contents)

shortLinesOnly :: String -> String
shortLinesOnly input =
    let allLines = lines input
        shortLines = filter (\lines -> length lines < 10) allLines
        result = unlines shortLines
    in  result
