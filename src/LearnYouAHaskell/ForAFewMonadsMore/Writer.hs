module LearnYouAHaskell.ForAFewMonadsMore.Writer where

import Data.Monoid
import Control.Monad.Writer
     
isBigGang :: Int -> Bool
isBigGang x = x > 9

isBigGang2 :: Int -> (Bool, String)
isBigGang2 x = (x > 9, "Compared gang size to 9")

applyLog :: (a,String) -> (a -> (b,String)) -> (b,String)
applyLog (x,log) f = let (y,newLog) = f x in (y,log ++ newLog)

-- Monoids to the rescue
applyLog' :: (Monoid m) => (a,m) -> (a -> (b,m)) -> (b,m)
applyLog' (x,log) f = let (y,newLog) = f x in (y,log `mappend` newLog)

type Food = String
type Price = Sum Int

addDrink :: Food -> (Food,Price)
addDrink "beans" = ("milk", Sum 25)
addDrink "jerky" = ("whiskey", Sum 99)
addDrink _ = ("beer", Sum 30)

-- The writer type
-- newtype Writer w a = Writer { runWriter :: (a, w) }

-- instance (Monoid w) => Monad (Writer w) where
--     return x = Writer (x, mempty)
--     (Writer (x,v)) >>= f = let (Writer (y,v')) = f x in Writer (y, v `mappend` v')

-- Using do notation with writer
-- logNumber :: Int -> Writer [String] Int
-- logNumber x = Writer (x, ["Got number: " ++ show x])

-- multWithLog :: Writer [String] Int
-- multWithLog = do
--     a <- logNumber 3
--     b <- logNumber 5
--     return (a*b)

-- Adding logging to programs
gcd' :: Int -> Int -> Int
gcd' a b
  | b == 0    = a
  | otherwise = gcd' b (a `mod` b)

gcd2' :: Int -> Int -> Writer [String] Int
gcd2' a b
    | b == 0 = do
        tell ["Finished with " ++ show a]
        return a
    | otherwise = do
        tell [show a ++ " mod " ++ show b ++ " = " ++ show (a `mod` b)]
        gcd2' b (a `mod` b)
