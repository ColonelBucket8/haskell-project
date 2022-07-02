module Main where
import IntroductionToHaskell
import Homework1

main :: IO ()
main = do 
    print(hanoi 5 "a" "c" "b")
     
