module Main where
import Lecture.IntroductionToHaskell
import Lecture.AlgebraicDataTypes

import Homework.Homework1

main :: IO ()
main = do 
    print(getAge brent)
    print(baz brent)
    print(checkFav brent) 
    print(checkFav stan) 
    print(intListProd Empty)
    print(intListProd (Cons 4 Empty))

