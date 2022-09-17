module Lecture.Lecture9.Functors where
  
-- Motivation

-- map :: (a -> b) -> [a] -> [b]
-- treeMap :: (a - b) -> Tree a -> Tree b
-- maybeEval :: (ExprT -> Int) -> Maybe ExprT -> Maybe Int
-- maybeMap :: (a -> b) -> Maybe a -> Maybe b

-- thingsMap :: (a -> b) -> f a -> f b

-- A brief digression on kinds
-- :k Bool
-- Bool :: *

-- :k Maybe Int
-- Maybe Int :: *

-- :k Maybe
-- Maybe :: * -> *

data JoinList m a = Empty
                   | Single m a
                   | Append m (JoinList m a) (JoinList m a)
-- :k JoinList 
-- JoinList :: * -> * -> *

data Funny f a = Funny a (f a)
-- :k Funny
-- Funny :: (* -> *) -> * -> *

-- Functor

-- instance Functor Maybe where
--     fmap _ Nothing  = Nothing
--     fmap f (Just a) = Just (f a)

-- instance Functor [] where
--     fmap _ []     = []
--     fmap f (x:xs) = f x : fmap f xs

-- instance Functor IO where
--     fmap f ioa = ioa >>= (\a -> return (f a))

-- fmap :: (a -> b) -> (->) e a -> (->) e b
-- -- with (->) written infix
-- fmap :: (a -> b) -> (e -> a) -> (e -> b)
-- instance Functor ((->) e) where
--     fmap = (.)
