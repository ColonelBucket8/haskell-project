module Main where
import Lecture.IntroductionToHaskell
import Lecture.AlgebraicDataTypes
import LearnYouAHaskell.StartingOut as Learn

import Homework.Homework1
import Homework.Homework2.LogAnalysis

main :: IO ()
main = do 
    print("Hello World")
    print(Learn.doubleSmallNumber 4)
    print(Learn.doubleSmallNumber 200)
