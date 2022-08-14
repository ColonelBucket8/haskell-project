{-# Language FlexibleInstances #-}
{-# OPTIONS_GHC -fno-warn-missing-methods #-}

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

-- Exercise 3
data Stream a = Stream a (Stream a)

streamToList :: Stream a -> [a]
streamToList (Stream x xs) = x : streamToList xs

instance Show a => Show (Stream a) where
    show = show .take 20 . streamToList

-- Exercise 4
streamRepeat :: a -> Stream a
streamRepeat x = Stream x (streamRepeat x)

streamMap :: (a -> b) -> Stream a -> Stream b
streamMap f (Stream x xs) = Stream (f x) (streamMap f xs)

streamFromSeed :: (a -> a) -> a -> Stream a
streamFromSeed f x = Stream x (streamFromSeed f (f x))

-- Exercise 5
nats :: Stream Integer
nats = streamFromSeed (\x -> x + 1) 0 

interleaveStreams :: Stream a -> Stream a -> Stream a
interleaveStreams (Stream x xs) (Stream y ys) = Stream x (Stream y (interleaveStreams xs ys))

rulerRepeat :: Integer -> Stream Integer
rulerRepeat 100 = streamRepeat 0
rulerRepeat i   = interleaveStreams (streamRepeat i) (rulerRepeat (i+1))

ruler :: Stream Integer
ruler = rulerRepeat 0

fibStream :: Stream Integer
fibStream = streamFromSeed fib 0 

-- Exercise 6
x :: Stream Integer
x = Stream 0 (Stream 1 (streamRepeat 0))

instance Num (Stream Integer) where
    fromInteger i = Stream i (streamRepeat 0)
    negate = streamMap negate
    (+) (Stream x xs) (Stream y ys) =  Stream (x + y) (xs + ys)
    (*) a@(Stream x xs) b@(Stream y ys) = Stream (x * y) (streamMap (*x) ys + (xs * b))

instance Fractional (Stream Integer) where
    (/) a@(Stream x xs) b@(Stream y ys) = Stream (x `div` y) (streamMap (* (1 `div` y)) (xs - a/b * ys) )

fibs3 :: Stream Integer
fibs3 = Stream 0 (fromInteger 1) / Stream 1 (Stream (-1) (Stream (-1) (streamRepeat 0)))

-- Exercise 7
data Matrix = Matrix Integer Integer Integer Integer

instance Num Matrix where
    (*) (Matrix a11 a12 a21 a22) (Matrix b11 b12 b21 b22) = Matrix (a11*b11 + a12*b21) (a11*b12+a12*b22) (a21*b11 + a22*b21) (a21*b12 + a22*b22)

f_n :: Matrix
f_n = Matrix 1 1 1 0

fib4 :: Integer -> Integer
fib4 0 = 0
fib4 x = a where (Matrix _ a _ _)  = f_n ^ x

main :: IO ()
main = do
    print $ fib 3
    print $ fib 5
    print $ fib 7
    -- print $ fibs1
    -- print $ fibs2
    print $ streamRepeat 5
    print $ streamMap (\x -> x + 1) $ streamRepeat 8
    print $ streamFromSeed (\x -> x + 1) 6
    print $ nats
    print $ ruler
    print $ fibStream
    print $ x^4
    print $ (1 + x)^5
    print $ x + x
    print $ x / (Stream 4 (streamFromSeed (+1) 4) )
    print $ fibs3
    print $ fib4 10000000