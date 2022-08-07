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

--  Exercise 2: Folding with trees
data Tree a = Leaf
            | Node Integer (Tree a) a (Tree a)
    deriving (Show, Eq)

insertTree :: a -> Tree a -> Tree a
insertTree x Leaf = Node 0 Leaf x Leaf
insertTree x (Node 0 Leaf y r) = Node 1 (insertTree x Leaf) y r
insertTree x (Node 1 l y Leaf) = Node 1 l y (insertTree x Leaf)
insertTree x (Node h t1@(Node h1 _ _ _) y t2@(Node h2 _ _ _))
    | h1 > h2 = Node h t1 y (insertTree x t2)    
    | h1 < h2 = Node h (insertTree x t1) y t2
    | h1 == h2 = do
        let n@(Node nh _ _ _) = insertTree x t1
        if nh > h1
            then Node (h+1) n y t2
            else Node h n y t2
    

foldTree :: [a] -> Tree a
foldTree = foldr insertTree Leaf

-- Exercise 3: More folds!
xorBinary :: Bool -> Bool -> Bool
xorBinary True True   = False 
xorBinary False False = False
xorBinary _ _         = True

xor :: [Bool] -> Bool
xor = foldr xorBinary False 

-- Implement map as a fold
map' :: (a -> b) -> [a] -> [b]
map' f = foldr (\x acc -> f x : acc) []

-- Implement foldl using foldr
-- myFoldl :: (a -> b -> a)  -> a -> [b] -> a
-- myFoldl f base xs = foldr (\x acc -> ) 

-- Exercise 4: Finding primes
cartProd :: [a] -> [b] -> [(a,b)]
cartProd xs ys = [(x,y) | x <- xs, y <- ys]

-- sieveSundaram :: Integer -> [Integer]
-- sieveSundaram n =  . filter (\(x,y) -> x <= y && x + y + 2*x*y <= n ) $ cartProd [1..n] [1..n]

main = do
    print $ fun1 [1,2,3,4,5,6,7]
    print $ fun1' [1,2,3,4,5,6,7]
    print $ fun2 75
    print $ fun2' 75
    print $ foldTree "abcdefg"
    print $ xor [False, True, False]
    print $ xor [False, True, False, False, True]
    print $ xor [False, False, True, False, False]
    print $ map' (*2)  [1,2,3,4]

