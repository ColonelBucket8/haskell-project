module Lecture.IntroductionToHaskell where

-- initialize variable
x :: Int
x = 3

-- function
sumtorial :: Integer -> Integer
sumtorial 0 = 0
sumtorial x = x + sumtorial (x-1)

-- function with multiple arguments
f :: Int -> Int -> Int -> Int
f x y z = x + y + z

-- lists
nums, range, range2 :: [Integer]
nums = [1,2,3,4]
range = [1..100]
range2 = [2,4..100]


hailstone :: Integer -> Integer
hailstone n
    | n `mod` 2 == 0 = n `div` 2
    | otherwise      = 3*n + 1

-- constructing lists
ex21 = [2,3,4] == 2 : 3 : 4 : []

-- function from integer to list
hailstoneSeq :: Integer -> [Integer]
hailstoneSeq 1 = [1]
hailstoneSeq n = n : hailstoneSeq (hailstone n)

-- pairs
p :: (Int, Char)
p = (3, 'x')

-- compute the length of a list of Integers
intListLength :: [Integer] -> Integer
intListLength [] = 0
intListLength (x:xs) = 1 + intListLength xs

