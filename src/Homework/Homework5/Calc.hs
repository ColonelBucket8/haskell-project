module Homework.Homework5.Calc where

import Homework.Homework5.ExprT

-- Exercise 1
eval :: ExprT -> Integer
eval (Lit x) = x 
eval (Add l r) = eval l + eval r
eval (Mul l r) = eval l * eval r 

main :: IO ()
main = do
    print $ eval (Mul (Add (Lit 2) (Lit 3)) (Lit 4))