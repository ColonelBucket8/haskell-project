module LearnYouAHaskell.MakingOurOwnTypesAndTypeclasses.Typeclasses102 where

data TrafficLight = Red | Yellow | Green

instance Eq TrafficLight where
    Red == Red = True
    Yellow == Yellow = True
    Green == Green = True
    _ == _ = False

instance Show TrafficLight where
    show Red = "Red Light"
    show Yellow = "Yello Light"
    show Green = "Green Light"
    
-- instance (Eq m) => Eq (Maybe m) where
--     Just x == Just y = x == y
--     Nothing == Nothing = True
--     _ == _ = False