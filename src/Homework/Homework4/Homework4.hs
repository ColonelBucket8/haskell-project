module Homework.Homework4.Homework4 where
-- Exercise 1: Wholemeal Programming

fun1 :: [Integer] -> Integer
fun1 [] = 1
fun1 (x:xs) 
    | even x    = (x - 2) * fun1 xs
    | otherwise = fun1 xs

fun1' :: [Integer] -> Integer
fun1' = product . map (2-) . filter even

fun2 :: Integer -> Integer
fun2 1 = 0
fun2 n
    | even n    = n + fun2 (n `div` 2)
    | otherwise = fun2 (3 * n + 1)

naturalNum :: Integer -> Integer
naturalNum x 
    | even x    = x `div` 2
    | otherwise = 3 * x + 1

fun2' :: Integer -> Integer
fun2' = sum . filter even . takeWhile (> 1) . iterate naturalNum



main = do
    print $ fun1 [1,2,3,4,5,6,7]
    print $ fun1' [1,2,3,4,5,6,7]
    print $ fun2 75
    print $ fun2' 75