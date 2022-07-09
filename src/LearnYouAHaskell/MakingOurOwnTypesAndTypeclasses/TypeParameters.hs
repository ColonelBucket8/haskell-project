module LearnYouAHaskell.MakingOurOwnTypesAndTypeclasses.TypeParameters where

data Vector a = Vector a a a deriving (Show)

addVector :: (Num t) => Vector t -> Vector t -> Vector t
(Vector i j k) `addVector` (Vector l m n) = Vector (i + l) (j + m) (k + n)

multiplyVector :: (Num t) => Vector t -> t -> Vector t
(Vector i j k) `multiplyVector` m = Vector (i * m) (j * m) (k * m)

scalarMult :: (Num t) => Vector t -> Vector t -> t
(Vector i j k) `scalarMult` (Vector l m n) = (i * l) + (j * m) + (k * n)