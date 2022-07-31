module Lecture.Lecture2.DefiningTypes where

import qualified Data.List as L
    
data BookInfo = Book Int String [String]
                deriving (Show)
                 
data MagazineInfo = Magazine Int String [String]
                    deriving (Show)

data BookReview = BookReview BookInfo CustomerID String

myInfo :: BookInfo
myInfo = Book 10 "Algebra of Programming" ["Richard"]

type CustomerID = Int
type ReviewBody = String

data BetterReview = BetterReview BookInfo CustomerID ReviewBody

type BookRecord = (BookInfo, BookReview)

-- Algebraic data types
type CardHolder = String
type CardNumber = String
type Address = [String]

data BillingInfo = CreditCard CardNumber CardHolder Address
                 | CashOnDelivery
                 | Invoice CustomerID
                   deriving (Show)

-- x and y coordinates or lengths
data Cartesian2D = Cartesian2D Double Double 
                   deriving (Eq, Show)

-- Angle and distance (magnitude)
data Polar2D = Polar2D Double Double
               deriving (Eq, Show)

-- The enumeration
data Roygbiv = Red
             | Orange
             | Yellow
             | Green
             | Blue
             | Indigo
             | Violet
               deriving (Eq, Show)

-- THe discriminated union 
type Vector = (Double, Double)

data Shape = Circle Vector Double
           | Poly [Vector]

-- Pattern Matching
sumList :: (Num a) => [a] -> a
sumList [] = 0
sumList (x:xs) = x + sumList xs

bookID :: BookInfo -> Int
bookID (Book id title authors) = id

bookTitle :: BookInfo -> String
bookTitle (Book id title authors) = title

bookAuthors :: BookInfo -> [String]
bookAuthors (Book id title authors) = authors

-- The wild card pattern

nicerID :: BookInfo -> Int
nicerID (Book id _ _) = id

nicerTitle :: BookInfo -> String
nicerTitle (Book _ title _) = title

nicerAuthors :: BookInfo -> [String]
nicerAuthors (Book _ _ authors) = authors

-- Record Syntax
data Customer = Customer {
    customerID      :: CustomerID
  , customerName    :: String
  , customerAddress :: Address
} deriving (Show)

-- data Customer = Customer Int String [String]
--                 deriving(Show)

type Day = String
type Month = String

data CalendarTime = CalendarTime {
    ctYear                      :: Int,
    ctMonth                     :: Month,
    ctDay, ctHour, ctMin, ctSec :: Int,
    ctPicosec                   :: Integer,
    ctWDay                      :: Day,
    ctYDay                      :: Int,
    ctTZName                    :: String,
    ctTZ                        :: Int,
    ctIsDST                     :: Bool
}

-- Parameterised Types
-- data Maybe a = Just a
--              | Nothing

data List a = Cons a (List a)
            | Nil
              deriving (Show)

fromList :: [a] -> List a
fromList (x:xs) = Cons x (fromList xs)
fromList []     = Nil

toList :: List a -> [a]
toList Nil = []
toList ( Cons x xs )  =  x : (toList xs)



data Tree a = Node a (Tree a) (Tree a)
            | Empty
              deriving (Show)

treeEx :: Tree String
treeEx = Node "parent" (Node "left child" Empty Empty)
                       (Node "right child" Empty Empty)

data TreeM a = NodeM a (Maybe (TreeM a)) (Maybe (TreeM a))
               deriving (Show)

treeExM :: TreeM String
treeExM = NodeM "parent" (Just (NodeM "left child" Nothing Nothing)) (Just (NodeM "right child" Nothing Nothing))

-- Reporting errors
mySecond :: [a] -> a
mySecond xs = if null (tail xs)
              then error "list too short"
              else head (tail xs)

-- A more controlled approach
safeSecond :: [a] -> Maybe a
safeSecond [] = Nothing
safeSecond (x:xs) = if null (tail xs)
                    then Nothing
                    else Just ( head (tail xs) )
                    
tidySecond :: [a] -> Maybe a
tidySecond [] = Nothing
tidySecond (_:x:_) = Just x

-- Introducing local variables
lend :: (Num a, Ord a) => a -> a -> Maybe a
lend amount balance = let reserve    = 100
                          newBalance = balance - amount
                      in if balance < reserve
                         then Nothing
                         else Just newBalance

-- The where clause                  
lend2 amount balance = if balance < reserve
                       then Nothing
                       else Just newBalance
  where reserve      = 100
        newBalance   = balance - amount

-- Local functions, global variables
pluralise :: String -> [Int] -> [String]
pluralise word counts = map plural counts
  where plural 0 = "no " ++ word ++ "s"
        plural 1 = "one " ++ word
        plural n = show n ++ " " ++ word ++ "s"

-- can also define variables, as well as functions, at the top of a source file
itemName :: String
itemName = "Weighted Companian Cube"

-- The case expression
fromMaybe :: a -> Maybe a -> a
fromMaybe defVal wrapped = 
  case wrapped of
    Nothing     -> defVal
    Just value  -> value

data Fruit = Apple | Lemon

betterFruit :: String -> Fruit
betterFruit fruit = case fruit of
                      "apple"   -> Apple
                      "lemon"  -> Lemon

-- Conditional evaluation with guards
nodesAreSame :: (Eq a) => Tree a -> Tree a -> Maybe a
nodesAreSame (Node a _ _) (Node b _ _)
  | a == b       = Just a
nodesAreSame _ _ = Nothing

lend3 :: (Num a, Ord a, Fractional a) => a -> a -> Maybe a
lend3 amount balance
  | amount <= 0             = Nothing
  | amount > reserve * 0.5  = Nothing
  | otherwise               = Just newBalance
  where reserve     = 100
        newBalance  = balance - amount

niceDrop :: Int -> [a] -> [a]
niceDrop _ [] = []
niceDrop n xs | n <= 0 = xs
niceDrop n (_:xs) = niceDrop (n - 1) xs
   
-- Exercises
length' :: [a] -> Int
length' [] = 0
length' (_:xs) = 1 + length' xs

sum' :: [Double] -> Double
sum' [] = 0
sum' (x:xs) = x + sum xs

mean :: [Double] -> Double
mean [] = 0
mean xs = sum' xs / fromIntegral (length' xs)

splitHalf :: [a] -> ([a], [a])
splitHalf xs 
  | odd (length xs) = ([], xs)
  | otherwise       = splitAt ((length xs + 1) `div` 2) xs

toPalindrome :: [a] -> [a]
toPalindrome [] = []
toPalindrome xs = xs ++ reverse xs

isPalindrome :: String -> Bool
isPalindrome word = word == reverse word 

sortListOfList :: [[a]] -> [[a]]
sortListOfList = L.sortBy (\a b -> compare  ( length a ) ( length b ))

-- intersperse' :: a -> [a] -> [a]
-- intersperse' _ [] = []
-- intersperse' n [xs,ys] = concat $ L.intersperse n [ys]

treeHeight :: Tree a -> Int
treeHeight Empty = 0
treeHeight ( Node a l r ) =  let leftTree = 1 + treeHeight l
                                 rightTree = 1 + treeHeight r
                             in if rightTree > leftTree
                                then rightTree
                                else leftTree

type Point = (Double, Double)
data Direction = Left | Right | Straight

-- direction :: Point -> Point -> Point -> Direction
-- direction (x1, y1) (x2, y2) (x3, y3)
--   | vectorA - vectorB == 0 = Straight  
--     where vectorA = (x1 - x2, y1 - y2)
--           vectorB = (x2 - x3, y2 - y3)
           



