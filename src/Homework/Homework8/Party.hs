module Homework.Homework8.Party where

import Homework.Homework8.Employee

-- Exercise 1
glCons :: Employee -> GuestList -> GuestList
glCons emp (GL emps fun) = GL (emp:emps) (fun + empFun emp)

instance Semigroup GuestList where
    (<>) (GL e1 f1) (GL e2 f2) = GL (e1 ++ e2) (f1 + f2)

instance Monoid GuestList where
    mempty = GL [] 0
    (GL e1 f1) `mappend` (GL e2 f2) = GL (e1 ++ e2) (f1 + f2)

moreFun :: GuestList -> GuestList -> GuestList
moreFun gl1 gl2 = if gl1 > gl2 then gl1 else gl2


main :: IO ()
main = do
    print $ "something"
