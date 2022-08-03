module Homework.Homework3.Golf where

-- skips :: [a] -> [[a]]
-- skips x = if length x == 1 
--           then [[x]] 
--           else map [0..] $ drop x

localMaxima :: [Int]  -> [Int]
localMaxima x | length x <= 2 = []
localMaxima (x:y:z:xs) 
    | y > x && y > z = y : localMaxima xs
    | otherwise      = localMaxima xs

main :: IO ()
main = do
    print $ localMaxima [1,2,3,4,5,4,3,2]