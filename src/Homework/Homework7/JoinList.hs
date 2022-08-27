module Homework.Homework7.JoinList where

import Homework.Homework7.Sized
import Homework.Homework7.Scrabble

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

dropJ :: (Sized b, Monoid b) => Int -> JoinList b a -> JoinList b a
dropJ _ Empty = Empty
dropJ 0 jl1 = jl1
dropJ n (Single _ _) = Empty
drop n jl@(Append m jl1 jl2)
          | count jl <= n = Empty
          | lcount <= n   = dropJ (n-lcount) jl2
          | lcount > n    = (dropJ n jl1) +++ jl2
          where lcount = count jl1
          
takeJ :: (Sized b, Monoid b) => Int -> JoinList b a -> JoinList b a
takeJ _ Empty = Empty
takeJ 0 _ = Empty
takeJ n jl@(Single _ _) = jl
takeJ n jl@(Append m jl1 jl2) 
          | count jl <= n = jl
          | lcount < n    = jl1 +++ takeJ (n-lcount) jl2
          | lcount == n   = jl1
          | lcount > n    = takeJ n jl1
          where lcount = count jl1 

--Exercise 3
scoreLine :: String -> JoinList Score String
scoreLine str = Single (scoreString str) str

main :: IO ()
main = do
  print $ scoreLine "test and 2" +++ scoreLine "test 4 and 2"
