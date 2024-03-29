{- CIS 194 HW 10
   due Monday, 1 April
-}

module Homework.Homework10.AParser where

import           Control.Applicative()

import           Data.Char

-- A parser for a value of type a is a function which takes a String
-- represnting the input to be parsed, and succeeds or fails; if it
-- succeeds, it returns the parsed value along with the remainder of
-- the input.
newtype Parser a = Parser { runParser :: String -> Maybe (a, String) }

-- For example, 'satisfy' takes a predicate on Char, and constructs a
-- parser which succeeds only if it sees a Char that satisfies the
-- predicate (which it then returns).  If it encounters a Char that
-- does not satisfy the predicate (or an empty input), it fails.
satisfy :: (Char -> Bool) -> Parser Char
satisfy p = Parser f
  where
    f [] = Nothing    -- fail on the empty input
    f (x:xs)          -- check if x satisfies the predicate
                        -- if so, return x along with the remainder
                        -- of the input (that is, xs)
        | p x       = Just (x, xs)
        | otherwise = Nothing  -- otherwise, fail

-- Using satisfy, we can define the parser 'char c' which expects to
-- see exactly the character c, and fails otherwise.
char :: Char -> Parser Char
char c = satisfy (== c)

{- For example:

*Parser> runParser (satisfy isUpper) "ABC"
Just ('A',"BC")
*Parser> runParser (satisfy isUpper) "abc"
Nothing
*Parser> runParser (char 'x') "xyz"
Just ('x',"yz")

-}

-- For convenience, we've also provided a parser for positive
-- integers.
posInt :: Parser Integer
posInt = Parser f
  where
    f xs
      | null ns   = Nothing
      | otherwise = Just (read ns, rest)
      where (ns, rest) = span isDigit xs

------------------------------------------------------------
-- Your code goes below here
------------------------------------------------------------

--Exercise 1
first :: (a -> b) -> (a,c) -> (b,c)
first f (x,y) = (f x,y)

instance Functor Parser where
  fmap f (Parser a) = Parser (fmap (first f) . a)

-- Exercise 2
instance Applicative Parser where
  pure x = Parser (\xs -> Just (x, xs))
  p1 <*> p2 = Parser func
    where
      func xs =
        case runParser p1 xs of
          Nothing -> Nothing
          Just (f, as) -> runParser (f <$> p2) as

-- Exercise 3
abParser :: Parser (Char, Char)
abParser = (,) <$> char 'a' <*> char 'b'

abParser_ :: Parser ()
abParser_ = (\_ _ -> ()) <$> char 'a' <*> char 'b'

intPair :: Parser [Integer]
intPair = (\a _ c -> [a, c]) <$> posInt <*> char ' ' <*> posInt

-- Exercise 4
-- (<\>) is intended to represent choice: that is,
-- f1 <|> f2 represents a choice between f1 and f2
class Applicative f => Alternative f where
  empty :: f a
  (<|>) :: f a -> f a -> f a

-- instance Alternative Parser where
--   empty  = Parser (const Nothing)
--   p1 <|> p2 = Parser (\xs -> runParser p1 xs <|> runParser p2 xs)

-- Exercise 5 
-- int0rUppercase :: Parser ()
-- int0rUppercase = (const () <$> satisfy isUpper) <|> (const () <$> posInt)

main :: IO ()
main = do
  print $ runParser abParser "abcdef"
  print $ runParser abParser "acdef"
  print $ runParser abParser_ "abcdef"
  print $ runParser abParser_ "acdef"
  print $ runParser intPair "12 34 56"
  -- print $ runParser int0rUppercase "ASDabcdef"
  -- print $ runParser int0rUppercase "1231231acdef"
  -- print $ runParser int0rUppercase "acdef"
