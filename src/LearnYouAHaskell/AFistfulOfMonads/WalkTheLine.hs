module LearnYouAHaskell.AFistfulOfMonads.WalkTheLine where

type Birds = Int
type Pole = (Birds,Birds)

landLeft :: Birds -> Pole -> Pole
landLeft n (left,right) = (left + n, right)

landRight :: Birds -> Pole -> Pole
landRight n (left,right) = (left, right + n) 

landLeft2 :: Birds -> Pole -> Maybe Pole
landLeft2 n (left,right)
    | abs ((left + n) - right) < 4 = Just (left + n, right)
    | otherwise                    = Nothing

landRight2 :: Birds -> Pole -> Maybe Pole
landRight2 n (left,right)
  | abs (left - (right + n)) < 4 = Just (left, right + n)
  | otherwise                    = Nothing

banana :: Pole -> Maybe Pole
banana _ = Nothing

routine :: Maybe Pole
routine = case landLeft2 1 (0,0) of
    Nothing -> Nothing
    Just pole1 -> case landRight2 4 pole1 of
        Nothing -> Nothing
        Just pole2 -> case landLeft2 4 pole2 of
                Nothing -> Nothing
                Just pole3 -> landLeft2 1 pole3

main = do
    print $ landLeft 3 (1,0)
    print $ landLeft2 4 (3,0)
    print $ landLeft2 1 (0,0) >>= landLeft2 3
    print $ landRight2 3 (0,0) >>= landLeft2 2
    print $ return (0,0) >>= landRight2 2 >>= landLeft2 2 >>= landRight2 2
    print $ return (0,0) >>= landLeft2 2 >>= landLeft2 2 >>= landRight2 2
    print $ return (0,0) >>= landRight2 2 >>= banana >>= landRight2 2
    print $ return (0,0) >>= landRight2 2 >> Nothing >>= landRight2 2
