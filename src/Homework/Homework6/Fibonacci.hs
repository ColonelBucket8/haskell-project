module Homework.Homework6.Fibonacci where

-- Exercise 1
fib :: Integer -> Integer
fib 0 = 0
fib 1 = 1
fib x = fib (x-1) + fib(x-2)

fibs1 :: [Integer]
fibs1 = map fib [0..]

-- Exercise 2
-- More efficient fibonacci
fibs2Val :: Integer -> Integer -> [Integer]
fibs2Val x y = z : fibs2Val y z
    where z = x + y

fibs2 :: [Integer]
fibs2 = 0 : 1 : fibs2Val 0 1 


main :: IO ()
main = do
    print $ fib 3
    print $ fib 5
    print $ fib 7
    -- print $ fibs1
    -- print $ fibs2