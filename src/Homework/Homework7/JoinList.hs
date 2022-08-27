module Homework.Homework7.JoinList where

import Homework.Homework7.Sized

-- data JoinListBasic a = Empty
--                      | Single a
--                      | Append (JoinListBasic a) (JoinListBasic a)

-- jlbToList :: JoinListBasic a -> [a]
-- jlbToList Empty = []
-- jlbToList (Single a) = [a]
-- jlbToList (Append l1 l2) = jlbToList l1 ++ jlbToList l2

data JoinList m a = Empty
                  | Single m a
                  | Append m (JoinList m a) (JoinList m a)
                  deriving (Eq, Show)

-- Exercise 1
tag :: Monoid m => JoinList m a -> m
tag Empty = mempty
tag (Single m _) = m
tag (Append m _ _) = m

(+++) :: Monoid m => JoinList m a -> JoinList m a -> JoinList m a
(+++) jl1 jl2 = Append ((tag jl1) `mappend` (tag jl2)) jl1 jl2

-- Exercise 2
jlToList :: JoinList m a -> [a]
jlToList Empty = []
jlToList (Single _ a) = [a]
jlToList (Append _ l1 l2) = jlToList l1 ++ jlToList l2

count :: (Sized b, Monoid b) => JoinList b a -> Int
count = getSize . size . tag

indexJ :: (Sized b, Monoid b) => Int -> JoinList b a -> Maybe a
indexJ 0 (Single m a) = Just a
indexJ i (Append m jl1 jl2) 
          | i < lcount = indexJ i jl1
          | i < (getSize . size) m = indexJ (i - lcount) jl2
          where lcount = count jl1
indexJ _ _ = Nothing
          
                  
