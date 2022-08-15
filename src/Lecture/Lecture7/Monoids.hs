module Lecture.Lecture7.Monoids where

import Data.Monoid

-- class Monoid m where
--     mempty :: m
--     mappend :: m -> m -> m
--     mconcat :: [m] -> m
    -- mconcat = foldr mappend mempty

-- Lists are monoids
-- instance Monoid [a] where
--     mempty = []
--     mappend = (++)

-- Product and sum

newtype Product a = Product { getProduct :: a }
    deriving (Eq, Ord, Read, Show, Bounded)

-- instance Num a => Monoid (Product a) where
--     mempty = Product 1
--     Product x `mappend` Product y = Product (x * y)

-- Any and all
newtype Any = Any { getAny :: Bool }
    deriving (Eq, Ord, Read, Show, Bounded)

-- instance Monoid Any where
--     mempty = Any False
--     Any x `mappend` Any y = Any (x || y)

newtype All = All { getAll :: Bool }
    deriving (Eq, Ord, Read, Show, Bounded)

-- instance Monoid All where
--     mempty = All True
--     All x `mappend` All y = All (x && y)

-- The ordering monoid
-- instance Monoid Ordering where
--     mempty = EQ
--     LT `mappend` _ = LT
--     EQ `mappend` y = y
--     GT `mappend` _ = GT

lengthCompare :: String -> String -> Ordering
lengthCompare x y = let a = length x `compare` length y
                        b = a `compare` b
                    in if a == EQ then b else a  

lengthCompare' :: String -> String -> Ordering
lengthCompare' x y = (length x `compare` length y) `mappend`
                     (x `compare` y)

lengthCompareWithVowel :: String -> String -> Ordering
lengthCompareWithVowel x y = (length x `compare` length y) `mappend`
                             (vowels x `compare` vowels y) `mappend`
                             (x `compare` y)
              where vowels = length . filter (`elem` "aeiou")