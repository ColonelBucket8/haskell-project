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


main :: IO ()
main = do
    print $ treeSize' treeEx2
    print $ treeSum' treeEx2
    print $ flatten' treeEx2
