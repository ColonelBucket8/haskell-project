module Lecture.Lecture7.Monoids where

import Data.Monoid
import qualified Data.Foldable as F

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

-- Maybe the monoid
-- instance Monoid a => Monoid (Maybe a) where
--     mempty = Nothing
--     Nothing `mappend` m = m
--     m `mappend` Nothing = m
--     Just m1 `mappend` Just m2 = Just (m1 `mappend` m2)

newtype First a = First { getFirst :: Maybe a }
    deriving (Eq, Ord, Read, Show)

-- instance Monoid (First a) where
--     mempty = First Nothing
--     First (Just x) `mappend` _ = First (Just x)
--     First Nothing `mappend` x = x

-- Using monoids to fold data structures
data Tree a = Empty | Node a (Tree a) (Tree a) deriving (Show, Read, Eq)

-- foldMap :: (Monoid M, Foldable t) => (a -> m) -> t a -> m
 
instance F.Foldable Tree where
    foldMap f Empty = mempty
    foldMap f (Node x l r) = F.foldMap f l `mappend`
                             f x           `mappend`
                             F.foldMap f r

testTree :: Tree Integer
testTree = Node 5
            (Node 3
                (Node 1 Empty Empty)
                (Node 6 Empty Empty)
            )
            (Node 9
                (Node 8 Empty Empty)
                (Node 10 Empty Empty)
            )

main :: IO ()
main = do
    print $ F.foldl (+) 0 testTree
    print $ F.foldMap (\x -> [x]) testTree
