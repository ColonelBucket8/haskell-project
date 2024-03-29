module Lecture.LazyEvaluation where

import Data.Array

-- Pattern matching drives evaluation
f1 :: Maybe a -> [Maybe a]
f1 m = [m,m]

f2 :: Maybe a -> [a]
f2 Nothing = []
f2 (Just x) = [x]

repeat' :: a -> [a]
repeat' x = x : repeat' x

take' :: Int -> [a] -> [a]
take' n _  | n <= 0 = []
take' _ []          = []
take' n (x:xs)      = x : take' (n-1) xs

foldl' :: (b -> a -> b) -> b -> [a] -> b
foldl' _ z []       = z
foldl' f z (x:xs)   = foldl' f (f z x) xs

if' :: Bool -> a -> a -> a
if' True x _  = x
if' False _ y = y

-- Dynamic Programming
knapsack01 :: [Double]  -- values
          -> [Integer] -- nonnegative weights 
          -> Integer   -- knapsack size 
          -> Double    -- max possible value
knapsack01 vs ws maxW = m!(numItems-1, maxW)
    where numItems = length vs
          m = array ((-1,0), (numItems-1, maxW)) $
                [((-1,w), 0) | w <- [0 .. maxW]] ++
                [((i,0), 0) | i <- [0 .. numItems-1]] ++
                [((i,w), best)
                    | i <- [0 .. numItems-1]
                    , w <- [1 .. maxW]
                    , let best
                            | ws!!i > w = m!(i-1, w)
                            | otherwise = max (m!(i-1, w))
                                            (m!(i-1, w - ws!!i) + vs!!i)
                ]

main :: IO ()
main = do
    print $ knapsack01 [3,4,5,8,10] [2,3,4,5,9] 20