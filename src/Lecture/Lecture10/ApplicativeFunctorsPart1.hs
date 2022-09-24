module Lecture.Lecture10.ApplicativeFunctorsPart1 where

type Name = String

data Employee = Employee { name  :: Name
                         , phone :: String }
                deriving Show

-- Applicative
class Functor f => Applicative f where
  pure  :: a -> f a
  (<*>) :: f (a -> b)    -> f a -> f b
  fmap  :: (a -> b)      -> f a -> f b
  fmap2 :: (a -> b -> c) -> f a -> f b -> f c

-- liftA2 :: Applicative f => (a -> b -> c) -> f a -> f b -> f c
-- liftA2 h fa fb = (h `fmap` fa) <*> fb


-- Applicative laws
-- f `fmap` x === pure f <*> x

-- Applicative examples
-- instance Applicative Maybe where
--   pure              = Just
--   Nothing <*> _     = Nothing
--   _ <*> Nothing     = Nothing
--   Just f <*> Just x = Just (f x)
