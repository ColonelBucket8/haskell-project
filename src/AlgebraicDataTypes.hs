module AlgebraicDataTypes where
-- Enumeration Types
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
