module LearnYouAHaskell.AFistfulOfMonads.TheListMonad where

-- instance Monad [] where
--     return x = [x]
--     xs >>= f = concat (map f xs)
--     fail _ = []

class Monad m => MonadPlus m where
    mzero :: m a
    mplus :: m a -> m a -> m a

instance MonadPlus [] where
    mzero = []
    mplus = (++)

guard :: (MonadPlus m) => Bool -> m ()
guard True = return ()
guard False = mzero


listOfTuples :: [(Int,Char)]
listOfTuples = do
    x <- [1,2]
    char <- ['a','b']
    return (x,char)

sevensOnly :: [Int]
sevensOnly = do
    x <- [1..50]
    guard ('7' `elem` show x)
    return x

main = do
    print $ [3,4,5] >>= \x -> [x,-x]
    print $ [1,2] >>= \x -> ['a', 'b'] >>= \char -> return ( x,char )
                                                    -- [(x,char)]
    print $ [1..50] >>= (\x -> guard ('7' `elem` show x) >> return x)
    -- List comprehension
    print $ [x | x <- [1..50], '7' `elem` show x]
