module Main where
import Lecture.IntroductionToHaskell
import Lecture.AlgebraicDataTypes
import LearnYouAHaskell.StartingOut as Starting
import LearnYouAHaskell.TypesAndTypeclasses as Types

import Homework.Homework1
import Homework.Homework2.LogAnalysis

main :: IO ()
main = do 
    print("Hello World")
    print(drop 3 [1,2,3,4])
    print(Starting.doubleFromTo 1 10)
    print(Starting.numbersFromTo 1 20)
    print(Starting.length' [1, 4, 5, 6, 7, 1])
    print(Types.removeNonUppercase "fasDfaSdf")
    print(Starting.rightTriangles 3 4 5)
    print(Starting.rightTriangles 3 4 6)
