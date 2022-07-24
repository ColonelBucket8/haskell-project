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

-- A Knight's Quest
type KnightPos = (Int,Int)

moveKnight :: KnightPos -> [KnightPos]
moveKnight (c,r) = do
    (c',r') <- [(c+2,r-1),(c+2,r+1),(c-2,r-1),(c-2,r+1)
               ,(c+1,r-2),(c+1,r+2),(c-1,r-2),(c-1,r+2)
               ]
    guard (c' `elem` [1..8] && r' `elem` [1..8])
    return (c',r')

-- Without monad
moveKnight2 :: KnightPos -> [KnightPos]
moveKnight2 (c,r) = filter onBoard
    [(c+2,r-1),(c+2,r+1),(c-2,r-1),(c-2,r+1)
    ,(c+1,r-2),(c+1,r+2),(c-1,r-2),(c-1,r+2)
    ]
    where onBoard (c,r) = c `elem` [1..8] && r `elem` [1..8]

in3 :: KnightPos -> [KnightPos]
in3 start = do
    first <- moveKnight start 
    second <- moveKnight first
    moveKnight second

in3' :: KnightPos -> [KnightPos]
in3' start = return start >>= moveKnight >>= moveKnight >>= moveKnight

canReachIn3 :: KnightPos -> KnightPos -> Bool
canReachIn3 start end = end `elem` in3 start
