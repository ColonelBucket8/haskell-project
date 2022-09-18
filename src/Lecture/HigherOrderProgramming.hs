module Lecture.HigherOrderProgramming where
     
greaterThan100 :: [Integer] -> [Integer]
greaterThan100 = filter (\x -> x > 100) 

greaterThan100_2 :: [Integer] -> [Integer]
greaterThan100_2 = filter (>100)

myTest :: [Integer] -> Bool
myTest xs = even (length (greaterThan100 xs))

-- Using function composition
myTest' :: [Integer] -> Bool
myTest' = even . length . greaterThan100

-- Currying and partial application
-- The arguments should be ordered from "least to greatest variation"
-- arguments which will often be the same should be listed first
-- and arguments which will often be different should come last

-- Wholemeal programming
-- Not good style
foobar :: [Integer] -> Integer
foobar [] = 0
foobar (x:xs)
    | x > 3     = (7*x + 1) + foobar xs
    | otherwise = foobar xs

foobar' :: [Integer] -> Integer
foobar' = sum . map (\x -> 7*x + 1) . filter (>3)

-- Folds
fold' :: b -> (a -> b -> b) -> [a] -> b
fold' z f []     = z
fold' z f (x:xs) = f x (fold' z f xs)
