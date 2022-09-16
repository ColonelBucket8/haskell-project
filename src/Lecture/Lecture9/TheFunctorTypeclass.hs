module Lecture.Lecture9.TheFunctorTypeclass where

-- class Functor f where
--     fmap :: (a -> b) -> f a -> f b

-- instance Functor [] where
--     fmap = map

-- instance Functor Maybe where
--     fmap f (Just x) = Just (f x)
--     fmap f Nothing  = Nothing

data Tree a = EmptyTree | Node a ( Tree a ) ( Tree a )

instance Functor Tree where
    fmap f EmptyTree = EmptyTree
    fmap f (Node x leftSub rightSub) = Node (f x) (fmap f leftSub) (fmap f rightSub)

-- instance Functor (Either a) where
--     fmap f (Right x) = Right (f x)
--     fmap f (Left x)  = Left x

-- data Either a b = Left a | Right b
