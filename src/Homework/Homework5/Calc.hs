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

-- Exercise 3
class Expr a where
    lit :: Integer -> a 
    add :: a -> a -> a
    mul :: a -> a -> a

instance Expr ExprT where
    lit = Lit
    add = Add
    mul = Mul 

-- Exercise 4
instance Expr Integer where
    lit = id 
    add = (+) 
    mul = (*)

instance Expr Bool where
    lit x = x > 0
    add x y = x || y
    mul x y = x && y

newtype MinMax = MinMax Integer deriving (Eq, Show)

instance Expr MinMax where
    lit = MinMax
    add (MinMax x) (MinMax y) = MinMax $ max x y
    mul (MinMax x) (MinMax y) = MinMax $ min x y
    
newtype Mod7 = Mod7 Integer deriving (Show, Eq)

instance Expr Mod7 where
    lit = Mod7
    add (Mod7 x) (Mod7 y) = Mod7 $ (x + y) `mod` 7
    mul (Mod7 x) (Mod7 y) = Mod7 $ (x * y) `mod` 7

testExp :: Expr a => Maybe a
testExp = parseExp lit add mul "(2+3)*4"


testInteger = testExp :: Maybe Integer
testBool    = testExp :: Maybe Bool
testMM      = testExp :: Maybe MinMax
testSat     = testExp :: Maybe Mod7

main :: IO ()
main = do
    print $ eval (Mul (Add (Lit 2) (Lit 3)) (Lit 4))
    print $ evalStr "(2+3)*4"
    print $ testInteger
    print $ testBool
    print $ testMM
    print $ testSat
