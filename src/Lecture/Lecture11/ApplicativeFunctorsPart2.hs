{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module Lecture.Lecture11.ApplicativeFunctorsPart2 where

import Control.Applicative (liftA2)

-- class Functor f where
--   fmap :: (a -> b) -> f a -> f b

-- class Functor f => Applicative f where
--   pure :: a -> f a
--   (<*>) :: f (a -> b) -> f a -> f b

-- instance Applicative [] where
--   pure a = [a]
--   [] <*> _ = []
--   (f:fs) <*> as = (map f as) ++ (fs <*> as)

newtype ZipList a = ZipList { getZipList :: [a] }
  deriving (Eq, Show, Functor)

instance Applicative ZipList where
  pure = ZipList . repeat
  ZipList fs <*> ZipList xs = ZipList (zipWith ($) fs xs)

-- Reader/environment
-- instance Functor ((->) e) where
--   fmap = (.)

-- instance Applicative ((->) e) where 
--   pure = const
--   f <*> x = \e -> (f e) (x e)

-- The Applicative API
pair :: Applicative f => f a -> f b -> f (a,b)
-- pair fa fb = (\x y -> (x,y)) <$> fa <*> fb
-- pair fa fb = (,) <$> fa <*> fb
-- pair fa fb = liftA2 (,) fa fb
pair = liftA2 (,)

