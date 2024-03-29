module Lecture.Polymorphism where

-- Type classes

data Foo = F Int | G Char

instance Eq Foo where
    (F i1) == (F i2) = i1 == i2
    (G c1) == (G c2) = c1 == c2
    _ == _ = False

    foo1 /= foo2 = not (foo1 == foo2)

data Foo' = F' Int | G' Char
    deriving (Eq, Ord, Show)

class Listable a where
    toList :: a -> [Int]
    -- toList :: [a] -> [Int]

instance Listable Int where
    toList x = [x]

instance Listable Bool where
    toList True = [1]
    toList False = [0]

-- instance Listable [Int] where
--     toList = id

data Tree a = Empty | Node a (Tree a) (Tree a)

-- instance Listable (Tree Int) where
--     toList Empty = []
--     toList (Node x l r) = toList l ++ [x] ++ toList r

sumL x = sum (toList x)
-- sumL :: Listable a => a -> Int

foo x y = sum (toList x) == sum (toList y) || x < y
-- foo:: (Listable a, Ord a) => a -> a -> Bool

instance (Listable a, Listable b) => Listable (a,b) where
    toList (x,y) = toList x ++ toList y
