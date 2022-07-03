module Main where
import Lecture.IntroductionToHaskell
import Lecture.AlgebraicDataTypes

import Homework.Homework1

main :: IO ()
main = do 
    print(hanoi 3 "a" "c" "b")
    print(hanoi2 3 "a" "c" "b")
    print(getAge brent)
     

