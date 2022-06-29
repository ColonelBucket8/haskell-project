module Homework1 where

-- convert digits to list
-- zero and negative numbers return empty list
toDigits :: Integer -> [Integer]
toDigits 0 = []
toDigits x | x < 0 = []
toDigits x = toDigits (x `div` 10) ++ [x `mod` 10]

-- conver digits to list reverse
toDigitsRev :: Integer -> [Integer]
toDigitsRev 0 = []
toDigitsRev x | x < 0 = []
toDigitsRev x = x `mod` 10 : toDigitsRev(x `div` 10)
