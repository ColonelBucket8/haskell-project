module LearnYouAHaskell.StartingOut where

-- else is mandatory in Haskell
doubleSmallNumber :: Integer -> Integer
doubleSmallNumber x = if x > 100 
                        then x
                        else x*2


