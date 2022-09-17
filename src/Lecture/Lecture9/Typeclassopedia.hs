module Lecture.Lecture9.Typeclassopedia where

-- class Functor f where
--     fmap :: (a -> b) -> f a -> f b

--     (<$) :: a        -> f b -> f a
    -- (<$) = fmap . const

-- instance Functor [] where
--     fmap :: (a -> b) -> [a] -> [b]
--     fmap _ []     = []
--     fmap g (x:xs) = g x : fmap g xs

-- instance Functor Maybe where
--     fmap :: (a -> b) -> Maybe a -> Maybe b
--     fmap _ Nothing  = Nothing
--     fmap g (Just a) = Just (g a) 

-- Exercises
-- instance Functor (Either e) where
--     fmap f (Right a) = Right (f a)
--     fmap f (Left a)  = Left a

data Pair a = Pair a a

instance Functor Pair where
    fmap f (Pair x y) = Pair (f x) (f y)

data ITree a = Leaf (Int -> a)
             | Node [ITree a]

-- instance Functor ITree where
--     fmap f (Leaf g)    = Leaf (f . g)
--     fmap f (Node (tree x):xs) = Node (tree (f x): fmap f xs ) 

-- Laws
-- fmap id = id
-- fmap (g . h) = (fmap g) . (fmap h)
