module LearnYouAHaskell.FunctorsApplicativeMonoids.ApplicativeFunctors where

import Control.Applicative

myAction :: IO String
myAction = (++) <$> getLine <*> getLine

main = do
    a <- (++) <$> getLine <*> getLine
    putStrLn $ "The two lines concatenated turn out to be: " ++ a

sequenceB :: (Applicative f) => [f a] -> f [a]
sequenceB [] = pure []
sequenceB (x:xs) = (:) <$> x <*> sequenceB xs

sequenceC :: (Applicative f) => [f a] -> f [a]
sequenceC = foldr (liftA2 (:)) (pure [])
