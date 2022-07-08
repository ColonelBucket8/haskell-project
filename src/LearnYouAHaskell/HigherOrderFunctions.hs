module LearnYouAHaskell.HigherOrderFunctions where

applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys

flip' :: (a -> b -> c) -> b -> a -> c 
flip' f x y = f y x

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
    let smallerSorted = quicksort $ filter (<=x) xs
        biggerSorted = quicksort $ filter (>x) xs
    in smallerSorted ++ [x] ++ biggerSorted

largestDivisible :: (Integral a) => a
largestDivisible = head $ filter p [100000, 99999..]
    where p x = x `mod` 3829 == 0

chain :: (Integral a) => a -> [a]
chain 1 = [1]
chain x 
    | x `mod` 2 == 0 = x : chain (x `div` 2) 
    | x `mod` 2 == 1 = x : chain (x * 3 + 1)

-- Using even and odd functions 
chain2 :: (Integral a) => a -> [a]
chain2 x
    | even x = x : chain (x `div` 2)
    | odd x = x : chain (x * 3 + 1)

numLongChains :: Int
numLongChains = length $ filter isLong $ map chain [1..100]
    where isLong xs = length xs > 15

-- Lambda
-- Anonymous function / callback
numLongChains2 :: Int
numLongChains2 = length $ filter (\xs -> length xs > 15) $ map chain [1..100]

flip2' :: (a -> b -> c) -> b -> a -> c
flip2' f = \x y -> f y x

-- Only folds and horses
sum' :: (Num a) => [a] -> a
sum' xs = foldl (\acc x -> acc + x) 0 xs
-- Shorter alternative 
-- foo a = bar b a
-- foo = bar b
-- sum' = foldl (+) 0

-- Sum using recursive function
sum2' :: (Num a) => [a] -> a
sum2' [] = 0
sum2' (x:xs) = x + sum2' xs

-- Left fold
elem' :: (Eq a) => a -> [a] -> Bool
elem' y ys = foldl (\acc x -> if x == y then True else acc) False ys

-- Right fold
-- right folds work on infinite lists, whereas left ones don't
map' :: (a -> b) -> [a] -> [b]
map' f ys = foldr (\x acc -> f x : acc) [] ys

-- ++ function is much more expensive than :
map2' :: (a -> b) -> [a] -> [b]
map2' f ys = foldl (\acc x -> acc ++ [f x]) [] ys

-- foldl1 and foldr1 functions work much like foldl and foldr,
-- don't need to provide them with an explicit starting value
maximum' :: (Ord a) => [a] -> a
maximum' = foldr1 (\x acc -> if x > acc then x else acc)

reverse' :: [a] -> [a]
reverse' = foldl (\acc x -> x : acc) []

product' :: (Num a) => [a] -> a
product' = foldr1 (*) 

filter' :: (a -> Bool) -> [a] -> [a]
filter' f = foldr (\x acc -> if f x then x : acc else acc) []

head' :: [a] -> a
head' = foldr1 (\x _ -> x)

last' :: [a] -> a
last' = foldl1 (\_ x -> x)

sqrtSums :: Int
sqrtSums = length (takeWhile (<1000) $ scanl1 (+) $ map sqrt [1..]) + 1

-- Function compositions
oddSquareSum :: Integer
oddSquareSum = sum . takeWhile (<10000) . filter odd . map (^2) $ [1..]
-- oddSquareSum = sum $ takeWhile (<10000) $ filter odd $ map (^2) [1..]
-- oddSquareSum = 
--     let oddSquares = filter odd $ map (^2) [1..]
--         belowLimit = takeWhile (<10000) oddSquares
--     in sum belowLimit
    