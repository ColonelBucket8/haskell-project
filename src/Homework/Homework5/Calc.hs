module Homework.Homework5.Calc where

import Homework.Homework5.ExprT
import Homework.Homework5.Parser

-- Exercise 1
eval :: ExprT -> Integer
eval (Lit x) = x 
eval (Add l r) = eval l + eval r
eval (Mul l r) = eval l * eval r 

-- Exercise 2
evalStr :: String -> Maybe Integer
evalStr str = maybe Nothing (Just . eval) (parseExp Lit Add Mul str)

main :: IO ()
main = do
    print $ eval (Mul (Add (Lit 2) (Lit 3)) (Lit 4))
    print $ evalStr "(2+3)*4"

