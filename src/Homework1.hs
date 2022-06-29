module Homework1 where

-- convert digits to list
-- zero and negative numbers return empty list
toDigits :: Integer -> [Integer]
toDigits 0 = []
toDigits x | x < 0 = []
toDigits x = toDigits (x `div` 10) ++ [x `mod` 10]
