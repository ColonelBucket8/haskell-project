module Main where
import IntroductionToHaskell
import Homework1

main :: IO ()
main = do 
    print(toDigits(0))
    print(toDigits(-1))
    print(toDigits(12348161))
    print(toDigitsRev(12345678))
    print(toDigitsRev(-1))

