module Homework1 where

-- convert digits to list
-- zero and negative numbers return empty list
toDigits :: Integer -> [Integer]
toDigits 0 = []
toDigits x | x < 0 = []
toDigits x = toDigits (x `div` 10) ++ [x `mod` 10]

-- convert digits to list reverse
toDigitsRev :: Integer -> [Integer]
toDigitsRev 0 = []
toDigitsRev x | x < 0 = []
toDigitsRev x = x `mod` 10 : toDigitsRev(x `div` 10)

-- double every 2nd element 
doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther (x:y:xs) = x : y * 2 : doubleEveryOther xs
doubleEveryOther a = a

-- sum of all digits in a list 
sumDigits :: [Integer] -> Integer
sumDigits (x:xs)  = sum(x:xs)
