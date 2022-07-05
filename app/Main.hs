module Main where
import Lecture.IntroductionToHaskell
import Lecture.AlgebraicDataTypes

import LearnYouAHaskell.StartingOut as Starting
import LearnYouAHaskell.TypesAndTypeclasses as Types
import LearnYouAHaskell.SyntaxInFunctions as Syntax

import Homework.Homework1
import Homework.Homework2.LogAnalysis

main :: IO ()
main = do 
    print $ Syntax.cylinder 4 6
    print $ Syntax.calcBmis2 [ ( 70, 160 ), (80, 150) ]
