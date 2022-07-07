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
