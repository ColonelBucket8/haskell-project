module Main where
import Lecture.IntroductionToHaskell
import Lecture.AlgebraicDataTypes

import LearnYouAHaskell.StartingOut as Starting
import LearnYouAHaskell.TypesAndTypeclasses as Types
import LearnYouAHaskell.SyntaxInFunctions as Syntax
import LearnYouAHaskell.Recursion as Recursion
import LearnYouAHaskell.HigherOrderFunctions as Higher

import Homework.Homework1
import Homework.Homework2.LogAnalysis

main :: IO ()
main = do 
    print $ Recursion.maximum' [1,2,3,4,7,19,1,2]
    print $ Recursion.maximum2' [1,2,3,4,7,19,1,2]
    print $ Recursion.replicate' 3 5
    print $ Recursion.take' 4 [1,2,3,4,5,6]
    print $ Recursion.reverse' [1,2,3,4,5]
    print $ Recursion.zip' [1,2,3] [4,5,6]
    print $ Recursion.elem' "r" ["a", "b", "c"]
    print $ Recursion.elem' "c" ["a", "b", "c"]
    print $ Recursion.quicksort [5,1,3,8,4,1,45,67]
    print $ Higher.applyTwice (+ 4) 20
    print $ Higher.zipWith' (+) [1,2,3] [4,5,6]
    print $ Higher.flip' zip [1,2] [3,4]
    print $ map (+3) [1,2,3]
    print $ filter (>3) [1,2,3,4,5,6]
    print $ Higher.quicksort [1,5,2,3,87,1,7,9]
    print $ Higher.largestDivisible 
    print $ sum $ takeWhile (<100) $ filter odd $ map (^2) [1..]
    print $ Higher.chain 1000
    print $ Higher.chain2 1000
    print $ Higher.numLongChains
    print $ Higher.numLongChains2
    print $ map (\x -> x + 1) [1..10]
    print $ Higher.zipWith' (\a b -> a + b) [1,2,3,4] [5,6,7,8]
    print $ Higher.sum' [1,2,3,4,5,6]
    print $ Higher.sum2' [1,2,3,4,5,6]
    print $ Higher.elem' 5 [1,2,3,4,5,6,7]
    print $ Higher.map' (+3) [1,2,3,4,5]
    print $ Higher.map' (*2) [1,2,3,4,5]
    print $ Higher.map2' (*2) [1,2,3,4,5]
    print $ Higher.maximum' [1,2,3,6,2,1]
    print $ Higher.reverse' [1,2,3,4]
    print $ Higher.product' [1,2,3]
    print $ Higher.filter' (>3) [2,6,2,1,7]
    print $ Higher.head' [4,1,2,3]
    print $ Higher.last' [1,2,3,4,5]
    print $ Higher.sqrtSums 
    print $ Higher.oddSquareSum
