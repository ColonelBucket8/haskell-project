module LearnYouAHaskell.TypesAndTypeclasses where

-- elem takes a thing and a list of things and tells us if that thing is an element
-- of the list
removeNonUppercase :: [Char] -> [Char]
removeNonUppercase str = [ c | c <- str, c `elem` ['A'..'Z']]


