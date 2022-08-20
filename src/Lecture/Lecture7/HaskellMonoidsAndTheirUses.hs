module Lecture.Lecture7.HaskellMonoidsAndTheirUses where

-- class Monoid m where
--     mappend :: m -> m -> m
--     mempty :: m

-- instance Monoid a where
--     mappend = (++)
--     mempty = []

-- Rules
-- a `mappend` mempty = a
-- mempty `mappend` a = a
-- (a `mmapend` b) `mappend` c == a `mappend` (b `mappend` c)

-- Some Uses of Monoids
-- instance Monoid Integer where
--     mappend = (+)
--     mempty = 0

-- instance Monoid Integer where
--     mappend = (*)
--     mempty = 1

-- Num a => Monoid (Sum a)
-- Num a => Monoid (Product a)

-- The Writer Monad