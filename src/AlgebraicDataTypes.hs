module AlgebraicDataTypes where

-- Enumeration Types
-- The deriving Show is a magical incantation which tells GHC to automatically generate default code for converting Things to Strings. This is what ghci uses when printing the value of an expression of type thing

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

-- Store a person's name, age, and favourite Thing
data Person = Person String Int Thing
    deriving Show

brent :: Person
brent = Person "Brent" 31 SealingWax

stan :: Person
stan = Person "Stan" 94 Cabbage

getAge :: Person -> Int
getAge (Person _ age _) = age

