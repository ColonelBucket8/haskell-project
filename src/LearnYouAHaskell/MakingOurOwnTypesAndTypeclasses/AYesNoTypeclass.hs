module LearnYouAHaskell.MakingOurOwnTypesAndTypeclasses.AYesNoTypeclass where

import LearnYouAHaskell.MakingOurOwnTypesAndTypeclasses.RecursiveDataStructures
import LearnYouAHaskell.MakingOurOwnTypesAndTypeclasses.Typeclasses102


class YesNo a where
    yesno :: a -> Bool

instance YesNo Int where
    yesno 0 = False
    yesno _ = True

instance YesNo [a] where
    yesno [] = False
    yesno _ = True

-- id is a standard library function that takes a parameter
-- and returns the same thing
instance YesNo Bool where
    yesno = id

instance YesNo (Maybe a) where
    yesno ( Just _ ) = True
    yesno Nothing = False

instance YesNo (Tree a) where
    yesno EmptyTree = False
    yesno _ = True

instance YesNo TrafficLight where
    yesno Red = False
    yesno _ = True

yesnoIf :: (YesNo y) => y -> a -> a -> a
yesnoIf yesnoVal yesResult noResult = if yesno yesnoVal then yesResult else noResult