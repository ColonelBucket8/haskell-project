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
import LearnYouAHaskell.MakingOurOwnTypesAndTypeclasses.TypeParameters as TypeParam
import LearnYouAHaskell.MakingOurOwnTypesAndTypeclasses.DerivedInstances as Derived
import LearnYouAHaskell.MakingOurOwnTypesAndTypeclasses.TypeSynonyms as TypeSynonyms
import LearnYouAHaskell.MakingOurOwnTypesAndTypeclasses.RecursiveDataStructures as Recursive

import Homework.Homework1
import Homework.Homework2.LogAnalysis

main :: IO ()
main = do 
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
    let vectorA = Vector 1 2 3
    let vectorB = Vector 4 5 6
    print $ TypeParam.addVector vectorA vectorB
    print $ TypeParam.multiplyVector vectorA 2
    print $ TypeParam.scalarMult vectorA vectorB
    print $ Wednesday
    let phoneBook = [("ezzy","1234"),("anne","81824"),("bob", "191234")]
    print $ TypeSynonyms.inPhoneBook "ezzy" "12" phoneBook
    print $ TypeSynonyms.inPhoneBook "ezzy" "1234" phoneBook
    print $ TypeSynonyms.lockers
    print $ TypeSynonyms.lockerLookup 101 TypeSynonyms.lockers 
    print $ TypeSynonyms.lockerLookup 109 TypeSynonyms.lockers 
    print $ TypeSynonyms.lockerLookup 120 TypeSynonyms.lockers 
    let nums = [1,2,3,4,5,6,2,1,3,4]
    print $ foldr treeInsert EmptyTree nums
    
