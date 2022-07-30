module Lecture.Lecture2.TypesAndFunctions where
myDrop :: Int -> [a] -> [a]
myDrop n xs = if n <= 0 || null xs
              then xs
              else myDrop (n - 1) (tail xs)

myDrop' :: Int -> [a] -> [a]
myDrop' _ [] = []
myDrop' n xs 
    | n <= 0 = xs
    | otherwise = myDrop' (n - 1) (tail xs)


lastButOne :: [a] -> a
lastButOne (x:y:[]) = x 
lastButOne (x:y:xs) = lastButOne (y:xs)
