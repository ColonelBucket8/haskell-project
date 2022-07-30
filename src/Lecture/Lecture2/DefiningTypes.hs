module Lecture.Lecture2.DefiningTypes where
    
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