module LearnYouAHaskell.ForAFewMonadsMore.TastefulStateful where

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
