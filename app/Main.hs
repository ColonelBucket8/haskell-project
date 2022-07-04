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
    print("Hello World")
    print(drop 3 [1,2,3,4])
    print(Starting.rightTriangles 3 4 5)
    print(Starting.rightTriangles 3 4 6)
    print(Syntax.factorial 0)
    print(Syntax.factorial 4)
    print(Syntax.addVectors (1, 1) (2, 3))
    print(Syntax.first (1, 2, 3))
    print $ Syntax.head' [2,4,6]
    print $ Syntax.tell [2,3,4,5]
    print $ Syntax.length' [2,3,4,5]
    print $ Syntax.sum' [2,3,4,5]
    print $ Syntax.capital "Dracula"
