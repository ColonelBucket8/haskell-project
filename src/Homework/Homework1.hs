module Homework.Homework1 where

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
-- map :: Integer -> [Integer] 
sumDigits :: [Integer] -> Integer
sumDigits = sum . map (sum . toDigits)

-- Validate credit card number
validate :: Integer -> Bool
validate creditCardNumber = sumDigits (doubleEveryOther (toDigitsRev creditCardNumber)) `mod` 10 == 0

-- Tower of Hanoi
type Peg = String
type Move = (Peg, Peg)
hanoi :: Integer -> Peg -> Peg -> Peg -> [Move]
hanoi 0 _ _ _ = []
hanoi 1 start end _ = [(start, end)]
hanoi n start end temp = 
    let nMinusOne = subtract 1 n
    in hanoi nMinusOne start temp end ++
       hanoi 1 start end temp ++
       hanoi nMinusOne temp end start

