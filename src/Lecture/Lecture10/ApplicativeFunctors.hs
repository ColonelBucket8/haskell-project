module Lecture.Lecture10.ApplicativeFunctors where

-- class (Functor f) => Applicative f where
--   pure :: a -> f a
--   (<*>) :: f (a -> b) -> f a -> f b

-- instance Applicative Maybe where
--   pure = Just
--   Nothing <*> _ = Nothing
--   (Just f) <*> something = fmap f something

(<$>) :: (Functor f) => (a -> b) -> f a -> f b
f <$> x = fmap f x
