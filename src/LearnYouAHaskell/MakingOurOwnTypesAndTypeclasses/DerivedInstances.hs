module LearnYouAHaskell.MakingOurOwnTypesAndTypeclasses.DerivedInstances where

data Person = Person { firstName :: String 
                     , lastName :: String
                     , age :: Int 
                     } deriving (Eq, Show, Read)

-- ghci> let mikeD = Person {firstName = "Michael", lastName = "Diamond", age = 43}  
-- ghci> let adRock = Person {firstName = "Adam", lastName = "Horovitz", age = 41}  
-- ghci> let mca = Person {firstName = "Adam", lastName = "Yauch", age = 44}  
-- ghci> mca == adRock  
-- False  
-- ghci> mikeD == adRock  
-- False  
-- ghci> mikeD == mikeD  
-- True  
-- ghci> mikeD == Person {firstName = "Michael", lastName = "Diamond", age = 43}  
-- True  

-- Read is pretty much the inverse typeclass of Show
-- ghci> read "Person {firstName =\"Michael\", lastName =\"Diamond\", age = 43}" :: Person  
-- Person {firstName = "Michael", lastName = "Diamond", age = 43}  

-- Enum typeclass is for thing that have predecessors and successors
-- Bounded typeclass which is for things that have a lowest possible value and highest possible value
data Day = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday
           deriving (Eq, Ord, Show, Read, Bounded, Enum)