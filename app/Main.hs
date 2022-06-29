module Main where
import IntroductionToHaskell
import Homework2

main :: IO ()
main = do 
    print(toDigits(0))
    print(toDigits(-1))
    print(toDigits(12348161))

