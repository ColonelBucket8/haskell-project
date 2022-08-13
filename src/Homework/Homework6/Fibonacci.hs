module Homework.Homework6.Fibonacci where

-- Exercise 1
fib :: Integer -> Integer
fib 0 = 0
fib 1 = 1
fib x = fib (x-1) + fib(x-2)

fibs1 :: [Integer]
fibs1 = map fib [0..]


main :: IO ()
main = do
    print $ fib 3
    print $ fib 5
    print $ fib 7
    print $ fibs1