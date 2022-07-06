module Main where
import Lecture.IntroductionToHaskell
import Lecture.AlgebraicDataTypes

import LearnYouAHaskell.StartingOut as Starting
import LearnYouAHaskell.TypesAndTypeclasses as Types
import LearnYouAHaskell.SyntaxInFunctions as Syntax
import LearnYouAHaskell.Recursion as Recursion

import Homework.Homework1
import Homework.Homework2.LogAnalysis

main :: IO ()
main = do 
    print $ Syntax.cylinder 4 6
    print $ Syntax.calcBmis2 [ ( 70, 160 ), (80, 150) ]
    print $ Syntax.head2' [1,3,56,7]
    print $ Syntax.describeList [1, 2, 4]
    print $ Syntax.describeList [1]
    print $ Syntax.describeList []
    print $ Recursion.maximum' [1,2,3,4,7,19,1,2]
    print $ Recursion.maximum2' [1,2,3,4,7,19,1,2]
    print $ Recursion.replicate' 3 5
    print $ Recursion.take' 4 [1,2,3,4,5,6]
    print $ Recursion.reverse' [1,2,3,4,5]
    print $ Recursion.zip' [1,2,3] [4,5,6]
    print $ Recursion.elem' "r" ["a", "b", "c"]