module Lecture.Lecture7.Fold where

import qualified Data.Foldable as F

-- foldr f z [] = z
-- foldr f z (x:xs) = f x (foldr f z xs)

-- foldl f z [] = z
-- foldl f z (x:xs) = foldl f (f z x) xs

pairs :: (a -> a -> a) -> [a] -> [a]
pairs f (x:y:t) = f x y : (pairs f t)
pairs f t    = t

foldt :: (a -> a -> a) -> a -> [a] -> a
foldt f z [] = z
foldt f z [x] = x
foldt f z xs = foldt f z (pairs f xs)

foldi :: (a -> a -> a) -> a -> [a] -> a
foldi f z [] = z
foldi f z (x:xs) = f x (foldi f z (pairs f xs))

-- primes :: (Integral a) => [a]
-- primes = 2 : 3 ([5.7..] `minus`
--                     foldi (\(x:xs) -> (x:) . union xs) []
--                         [[p*p, p*p+2*p..] | p <- tail primes])