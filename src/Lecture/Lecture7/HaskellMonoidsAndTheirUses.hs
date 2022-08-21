
{-# LANGUAGE FlexibleContexts #-}

module Lecture.Lecture7.HaskellMonoidsAndTheirUses where

import Data.Monoid
import Data.Foldable
import Control.Monad.Writer
import Control.Monad.State

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
fact1 :: Integer -> Writer String Integer
fact1 0 = return 1
fact1 n = do
    let n' = n-1
    tell $ "We've taken one away from " ++ show n ++ "\n"
    m <- fact1 n'
    tell $ "We've called f " ++ show m ++ "\n"
    let r = n*m
    tell $ "We've multiplied " ++ show n ++ " and " ++ show m ++ "\n"
    return r

fact2 :: Integer -> Writer (Sum Integer) Integer
fact2 0 = return 1
fact2 n = do
    let n' = n - 1
    tell $ Sum 1
    m <- fact2 n' 
    let r = n*m
    tell $ Sum 1
    return r

fact3 :: Integer -> State Integer Integer
fact3 0 = return 1
fact3 n = do
    let n' = n - 1
    modify (+1)
    m <- fact3 n'
    let r = n*m
    modify (+1)
    return r

fact4 :: Integer -> Writer Any Integer
fact4 0 = return 1
fact4 n = do
    let n' = n-1
    m <- fact4 n'
    let r = n*m
    tell (Any (r==120))
    return r

-- Commutative Monoids, Non-Commutative Monoids and Dual Monoids
fact5 :: Integer -> Writer (Dual String) Integer
fact5 0 = return 1
fact5 n = do
    let n' = n-1
    tell $ Dual $ "We've taken one away from " ++ show n ++ "\n"
    m <- fact5 n'
    tell $ Dual $ "We've called f " ++ show m ++ "\n"
    let r = n*m
    tell $ Dual $ "We've multiplied " ++ show n ++ " and " ++ show m ++ "\n"
    return r

-- The Product Monoid
-- instance (Monoid a, Monoid b) => Monoid (a,b) where
--     mempty = (mempty, mempty)
--     mappend (u,v) (w,x) = (u `mappend` w, v `mappend` x)

-- tellFst :: (Monoid a, Monoid b) => a -> WriterT a b
tellFst :: (MonadWriter (a, b) m, Monoid b) => a -> m ()
tellFst a = tell $ (a, mempty)  

tellSnd :: (MonadWriter (a, b) m, Monoid a) => b -> m ()
tellSnd a = tell $ (mempty, a)

fact6 :: Integer -> Writer (String, Sum Integer) Integer
fact6 0 = return 1
fact6 n = do
    let n' = n - 1
    tellSnd (Sum 1)
    tellFst $ "We've taken one away from " ++ show n ++ "\n"
    m <- fact6 n'
    let r = n*m
    tellSnd (Sum 1)
    tellFst $ "We've multiplied " ++ show n ++ " and " ++ show m ++ "\n"
    return r

-- Foldable Data
data Tree a = Empty
            | Leaf a
            | Node (Tree a) a (Tree a)

instance Foldable Tree where
    foldMap f Empty = mempty
    foldMap f (Leaf x) = f x
    foldMap f (Node l x r) = foldMap f l `mappend` f x `mappend` foldMap f r

tree :: (Num a) => Tree a
tree = Node (Leaf 1) 7 (Leaf 2)


main :: IO ()
main = do
    print $ runWriter (fact1 10)
    print $ runWriter (fact2 10)
    print $ runState (fact3 10) 0
    print $ runWriter (fact4 10)
    print $ runWriter (fact5 10)
    print $ runWriter (fact6 10)
    print $ foldMap (Any . (== 1)) tree
    print $ foldMap (All . (> 5)) tree