module LearnYouAHaskell.ForAFewMonadsMore.Writer where

import Data.Monoid
     
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
newtype Writer w a = Writer { runWriter :: (a, w) }

-- instance (Monoid w) => Monad (Writer w) where
--     return x = Writer (x, mempty)
--     (Writer (x,v)) >>= f = let (Writer (y,v')) = f x in Writer (y, v `mappend` v')


