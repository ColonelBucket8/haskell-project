module LearnYouAHaskell.AFistfulOfMonads.DoNotation where

import LearnYouAHaskell.AFistfulOfMonads.WalkTheLine

foo :: Maybe String
foo = Just 3   >>= (\x ->
      Just "!" >>= (\y ->
      Just (show x ++ y)))

foo2 :: Maybe String
foo2 = do
    x <- Just 3
    y <- Just "!"
    Just (show x ++ y)

maySue :: Maybe Bool
maySue = do
    x <- Just 9
    Just (x > 8)

routine :: Maybe Pole
routine = do
    start <- return (0,0)
    first <- landLeft2 2 start
    Nothing
    second <- landRight2 2 first
    landLeft2 1 second

justH :: Maybe Char
justH = do
    (x:xs) <- Just "Hello"
    return x

fail :: (Monad m) => String -> m a
fail msg = error msg

wopwop :: Maybe Char
wopwop = do
    (x:xs) <- Just ""
    return x
