module LearnYouAHaskell.FunctorsApplicativeMonoids.Monoids where

import Data.Monoid
import qualified Data.Foldable as F

-- The function takes two parameters
-- The parameters and the returned value have the same type
-- There exists such a value that doesn't change other values when used with the binary function 
--

-- class Monoid m where
--     mempty :: m
--     mappend :: m -> m -> m
--     mconcat :: [m] -> m
--     mconcat = foldr mappend mempty

-- instance Monoid [a] where
--     mempty = []
--     mappend = (++)

newtype Product a = Product { getProduct :: a }
    deriving (Eq, Ord, Read, Show, Bounded)

-- instance Num a => Monoid (Product a) where
--     mempty = Product 1
--     Product x `mappend` Product y = Product (x * y)

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

-- instance Monoid Ordering where
--     mempty = EQ
--     LT `mappend` _ = LT
--     EQ `mappend` y = y
--     GT `mappend` _ = GT

lengthCompare :: String -> String -> Ordering
lengthCompare x y = let a = length x `compare` length y
                        b = x `compare` y
                    in if a == EQ then b else a

lengthCompare2 :: String -> String -> Ordering
lengthCompare2 x y = (length x `compare` length y) `mappend` (x `compare` y)

lengthCompare3 :: String -> String -> Ordering
lengthCompare3 x y = (length x `compare` length y) `mappend`
                     (vowels x `compare` vowels y) `mappend`
                     (x `compare` y)
    where vowels = length . filter (`elem` "aeiou") 

newtype First a = First { getFirst :: Maybe a }
    deriving (Eq, Ord, Read, Show)

-- instance Monoid (First a) where
--     mempty = First Nothing
--     First (Just x) `mappend` _ = First (Just x)
--     First Nothing `mappend` x = x

data Tree a = Empty | Node a (Tree a) (Tree a) deriving (Show, Read, Eq)

instance F.Foldable Tree where
    foldMap f Empty = mempty
    foldMap f (Node x l r) = F.foldMap f l `mappend`
                             f x           `mappend`
                             F.foldMap f r
