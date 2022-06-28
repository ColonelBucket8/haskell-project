module Main where
import IntroductionToHaskell
import Hw1Exercise1
main :: IO ()
main = do 
    print(toDigits(0))
    print(toDigits(-1))
    print(toDigits(12348161))

