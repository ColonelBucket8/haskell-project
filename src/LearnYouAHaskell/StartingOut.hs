module LearnYouAHaskell.StartingOut where

-- List Comprehension
-- after, is called predicate (filtering)
doubleFromTo :: Integer -> Integer -> [Integer]
doubleFromTo start end = [x*2 | x <- [start..end], x*2 > 12]

-- numbers from start to end that are not 13, 15 or 19
numbersFromTo :: Integer -> Integer -> [Integer]
numbersFromTo start end = [x | x <- [start..end], x /= 13, x /= 15, x /= 19]

-- Return the length of list
length' :: [Integer] -> Integer
length' xs = sum [1 | _ <- xs]

-- else is mandatory in Haskell
doubleSmallNumber :: Integer -> Integer
doubleSmallNumber x = if x > 100 
                        then x
                        else x*2

rightTriangles :: Integer -> Integer -> Integer -> Bool
rightTriangles a b c | a^2 + b^2 == c^2 = True
rightTriangles _ _ _ = False
