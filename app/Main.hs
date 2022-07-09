module Main where

import Geometry as Geometry

import Lecture.IntroductionToHaskell
import Lecture.AlgebraicDataTypes

import LearnYouAHaskell.StartingOut as Starting
import LearnYouAHaskell.TypesAndTypeclasses as Types
import LearnYouAHaskell.SyntaxInFunctions as Syntax
import LearnYouAHaskell.Recursion as Recursion
import LearnYouAHaskell.HigherOrderFunctions as Higher
import LearnYouAHaskell.Modules as Modules
import LearnYouAHaskell.MakingOurOwnTypesAndTypeclasses.Shape as Shape
import LearnYouAHaskell.MakingOurOwnTypesAndTypeclasses.RecordSyntax as Record

import Homework.Homework1
import Homework.Homework2.LogAnalysis

main :: IO ()
main = do 
    print $ Higher.applyTwice (+ 4) 20
    print $ Higher.zipWith' (+) [1,2,3] [4,5,6]
    print $ Higher.flip' zip [1,2] [3,4]
    print $ map (+3) [1,2,3]
    print $ filter (>3) [1,2,3,4,5,6]
    print $ Higher.quicksort [1,5,2,3,87,1,7,9]
    print $ Higher.largestDivisible 
    print $ sum $ takeWhile (<100) $ filter odd $ map (^2) [1..]
    print $ Higher.chain 1000
    print $ Higher.chain2 1000
    print $ Higher.numLongChains
    print $ Higher.numLongChains2
    print $ map (\x -> x + 1) [1..10]
    print $ Higher.zipWith' (\a b -> a + b) [1,2,3,4] [5,6,7,8]
    print $ Higher.sum' [1,2,3,4,5,6]
    print $ Higher.sum2' [1,2,3,4,5,6]
    print $ Higher.elem' 5 [1,2,3,4,5,6,7]
    print $ Higher.map' (+3) [1,2,3,4,5]
    print $ Higher.map' (*2) [1,2,3,4,5]
    print $ Higher.map2' (*2) [1,2,3,4,5]
    print $ Higher.maximum' [1,2,3,6,2,1]
    print $ Higher.reverse' [1,2,3,4]
    print $ Higher.product' [1,2,3]
    print $ Higher.filter' (>3) [2,6,2,1,7]
    print $ Higher.head' [4,1,2,3]
    print $ Higher.last' [1,2,3,4,5]
    print $ Higher.sqrtSums 
    print $ Higher.oddSquareSum
    print $ Modules.numUniques [1,2,2,3,1,5]
    print $ Modules.search "Cat" "Cat in the jungle"
    print $ Modules.encode 3 "Hello world!"
    print $ Modules.decode 3 "Khoor#zruog$"
    print $ Modules.findKey "anne" [("ezzy","1234"),("anne","81824"),("bob", "191234")]
    print $ Modules.fromList' [(1,2),(3,4)]
    print $ Modules.phoneBookToMap [("ezzy","1234"),("anne","81824"),("bob", "191234"),("ezzy","1234"),("anne","81824"),("bob", "191234")]
    print $ Geometry.cubeVolume 5
    print $ Shape.surface (Circle  ( Point  4.0 3.0 )  5.0)
    print $ Shape.surface (Rectangle ( Point 2.0 3.0 )  ( Point 4.0 2.0 ))
    print $ Shape.nudge (Circle (Point 4.0 3.0) 5.0) 2.0 2.0
    print $ Shape.nudge (Rectangle (Point 2.0 3.0) (Point 4.0 2.0)) 2.0 2.0
    print $ Shape.nudge (Shape.baseCircle 5.0) 60 23
    print $ Shape.baseRect 2.0 3.0
    let guy = Record.Person "guy" "buddy" 12 160.5 "12356" "vanilla"
    print $ Record.firstName guy
    
