module Lecture.Lecture7.FoldsAndMonoids where

data Tree a = Empty
            | Node (Tree a) a (Tree a)
            deriving (Show, Eq)

leaf :: a -> Tree a
leaf x = Node Empty x Empty
   
treeSize :: Tree a -> Integer
treeSize Empty = 0
treeSize (Node l x r) = 1 + treeSize l + treeSize r

treeSum :: Tree Integer -> Integer
treeSum Empty = 0
treeSum (Node l x r) = x + treeSum l + treeSum r

treeDepth :: Tree a -> Integer
treeDepth Empty = 0
treeDepth (Node l x r) = 1 + max (treeDepth l) (treeDepth r)
 
flatten :: Tree a -> [a]
flatten Empty = []
flatten (Node l x r) = flatten l ++ [x] ++ flatten r

-- takes a Tree as input
-- pattern-matches on the input Tree
-- in the Empty case, gives a simple answer
-- in the Node case
   -- calls itself recursively on both subtrees
   -- somehow combines the results from the recursive 
   -- calls with the data x to produce the final result 

treeFold :: b -> (b -> a -> b -> b) -> Tree a -> b
treeFold e _ Empty = e
treeFold e f (Node l x r) = f (treeFold e f l) x (treeFold e f r)

treeEx2 :: Tree Integer
treeEx2 = Node (Node Empty 3 Empty) 4 (Node Empty 1 Empty)

treeSize' :: Tree a -> Integer
treeSize' = treeFold 0 (\l _ r -> 1 + l + r)

treeSum' :: Tree Integer -> Integer
treeSum' = treeFold 0 (\l x r -> x + l + r)

treeDepth' :: Tree a -> Integer
treeDepth' = treeFold 0 (\l _ r -> 1 + max l r)

flatten' :: Tree a -> [a]
flatten' = treeFold [] (\l x r -> l ++ [x] ++ r)

treeMax :: (Ord a, Bounded a) => Tree a -> a
treeMax = treeFold minBound (\l x r -> l `max` x `max` r)

-- Folding expressions
data ExprT = Lit Integer
           | Add ExprT ExprT
           | Mul ExprT ExprT

eval :: ExprT -> Integer
eval (Lit i) = i
eval (Add e1 e2) = eval e1 + eval e2
eval (Mul e1 e2) = eval e1 * eval e2

exprTFold :: (Integer -> b) -> (b -> b -> b) -> (b -> b -> b) -> ExprT -> b
exprTFold f _ _ (Lit i) = f i
exprTFold f g h (Add e1 e2) = g (exprTFold f g h e1) (exprTFold f g h e2)
exprTFold f g h (Mul e1 e2) = h (exprTFold f g h e1) (exprTFold f g h e2)

eval2 :: ExprT -> Integer
eval2 = exprTFold id (+) (*)

numLiterals :: ExprT -> Int
numLiterals = exprTFold (const 1) (+) (+)

-- Monoids
-- class Monoid m where
--    mempty :: m
--    mappend :: m -> m -> m

--    mconcat :: [m] -> m
--    mconcat = foldr mappend mempty

(<>) :: Monoid m => m -> m -> m
(<>) = mappend

-- instance Monoid [a] where
--    mempty = []
--    mappend = (++)

-- newtype Sum a = Sum a
--    deriving (Eq, Ord, Num, Show)

-- getSum :: Sum a -> a
-- getSum (Sum a) = a

-- instance Num a => Monoid (Sum a) where
--    mempty = Sum 0
--    mappend = (+)

-- newtype Product a = Product a
--    deriving (Eq, Ord, Num, Show)

-- getProduct :: Product a -> a
-- getProduct (Product a) = a

-- instance Num a => Monoid (Product a) where
--    mempty = Product 1
--    mappend = (*)

lst :: [Integer]
lst = [1,2,3,4]

-- prod :: Integer
-- prod = getProduct . mconcat . map Product $ lst

-- instance (Monoid a, Monoid b) => Monoid (a,b) where
--    mempty = (mempty, mempty)
--    (a,b) `mappend` (c,d) = (a `mappend` c, b `mappend` d) 

main :: IO ()
main = do
    print $ treeSize' treeEx2
    print $ treeSum' treeEx2
    print $ flatten' treeEx2
