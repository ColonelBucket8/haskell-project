{-# LANGUAGE TypeSynonymInstances #-}

module Lecture.Lecture7.MonoidsAndFingerTrees where

import Data.Monoid
    
data Tree v a = Leaf v a
              | Branch v (Tree v a) (Tree v a)

toList :: Tree v a -> [a]
toList (Leaf _ a) = [a] 
toList (Branch _ l r) = toList l ++ toList r


tag :: Tree v a -> v
tag (Leaf v _) = v
tag (Branch v _ _) = v

headTree :: Tree v a -> a
headTree (Leaf _ a) = a
headTree (Branch _ l _) = headTree l

type Size = Int

leaf :: a -> Tree Size a
leaf a = Leaf 1 a

branch :: Tree Size a -> Tree Size a -> Tree Size a
branch x y = Branch (tag x + tag y) x y

-- (!!) :: Tree Size a -> Int -> a
-- (Leaf _ a) !! 0 = a
-- (Branch _ x y) !! n
--     | n < tag x = x !! n
--     | otherwise = y !! (n - tag x)

-- A priority queue
type Priority = Int

winner :: Tree Priority a -> a
winner t = go t
    where go (Leaf _ a) = a
          go (Branch _ x y)
            | tag x == tag t = go x
            | tag y == tag t = go y 

-- Monoids - the grand unifier
-- instance Monoid Size where
--     mempty = 0
--     mappend = (+)

-- instance Monoid Priority where
--     mempty = maxBound
--     mappend = min

branch' :: Monoid v => Tree v a -> Tree v a -> Tree v a
branch' x y = Branch (tag x <> tag y) x y

class Monoid v => Measured v where
    measure :: a -> v

leaf' :: Measured v => a -> Tree v a
leaf' a = Leaf (measure a) a

-- instance Measured Size where
--     measure _ = 1


