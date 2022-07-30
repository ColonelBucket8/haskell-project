module Lecture.Lecture2.AlgebraicDataTypes where

-- Enumeration Types
-- The deriving Show is a magical incantation which tells GHC to automatically 
-- generate default code for converting Things to Strings. This is what ghci uses 
-- when printing the value of an expression of type thing

data Thing = Shoe
           | Ship
           | SealingWax
           | Cabbage
           | King
    deriving Show

shoe :: Thing
shoe = Shoe

listOfThings :: [Thing]
listOfThings = [Shoe, Ship, SealingWax, Cabbage, King]

isSmall :: Thing -> Bool
isSmall Ship = False
isSmall King = False
isSmall _    = True

-- Beyond Enumeration
data FailableDouble = Failure
                    | Ok Double
    deriving Show

safeDiv :: Double -> Double -> FailableDouble
safeDiv _ 0 = Failure
safeDiv x y = Ok (x / y)

failureToZero :: FailableDouble -> Double
failureToZero Failure = 0
failureToZero (Ok d) = d

-- Case Expressions
failureToZero2 :: FailableDouble -> Double
failureToZero2 x = case x of
                        Failure -> 0
                        Ok d    -> d

-- Store a person's name, age, and favourite Thing
data Person = Person String Int Thing
    deriving Show

brent :: Person
brent = Person "Brent" 31 SealingWax

stan :: Person
stan = Person "Stan" 94 Cabbage

getAge :: Person -> Int
getAge (Person _ age _) = age

-- Pattern Matching
-- A pattern of the form x@pat can be used to match a value against the pattern pat, 
-- but also give the name x to the entire value being matched
baz :: Person -> String
baz p@(Person n _ _) = "The name field of (" ++ show p ++ ") is " ++ n

checkFav :: Person -> String
checkFav (Person n _ SealingWax) = n ++ ", you're my kind of person!"
checkFav (Person n _ _) = n ++ ", your favorite thing is lame."

-- Recursive Data Types
data IntList = Empty | Cons Int IntList

intListProd :: IntList -> Int
intListProd Empty = 1
intListProd (Cons x Empty) = x * intListProd Empty
