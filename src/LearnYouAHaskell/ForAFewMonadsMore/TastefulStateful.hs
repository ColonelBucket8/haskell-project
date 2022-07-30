module LearnYouAHaskell.ForAFewMonadsMore.TastefulStateful where

import Control.Monad.State
import System.Random

-- threeCoins :: StdGen -> (Bool, Bool, Bool)
-- threeCoins gen =
--     let (firstCoin, newGen) = random gen
--         (secondCoin, newGen') = random newGen
--         (thirdCoin, newGen'') = random newGen'
--     in (firsrCoin, secondCoin, thirdCoin)

-- Stacks and stones
type Stack = [Int]

pop :: Stack -> (Int,Stack)
pop (x:xs) = (x,xs)

push :: Int -> Stack -> ((),Stack)
push a xs = ((),a:xs)

stackManip :: Stack -> (Int,Stack)
stackManip stack = let
    ((),newStack1) = push 3 stack
    (a,newStack2) = pop newStack1
    in pop newStack2

stackManip' :: Stack -> (Int,Stack)
stackManip' = do
    push 3
    a <- pop
    pop

-- The State Monad
-- newtype State s a = State { runState :: s -> (a,s) }

-- instance Monad (State s) where
--     return x = State $ \s -> (x,s)
--     (State h) >>= f = State $ \s -> let (a,newState) = h s
--                                         (State g) = f a
--                                     in g newState

pop' :: State Stack Int 
pop' = state $ \(x:xs) -> (x,xs)

push' :: Int -> State Stack ()
push' a = state $ \xs -> ((),a:xs)

stackManip'' = do
    push 3 
    pop
    pop

-- stackStuff :: State Stack ()
-- stackStuff = do
--     a <- pop
--     if a == 5
--        then push 5
--        else do
--            push 3
--            push 8

-- Randomness and the state monad

-- random :: (RandomGen g, Random a) => g -> (a, g)
randomSt :: (RandomGen g, Random a) => State g a
randomSt = state random

threeCoins :: State StdGen (Bool,Bool,Bool)
threeCoins = do
    a <- randomSt
    b <- randomSt
    c <- randomSt
    return (a,b,c)

