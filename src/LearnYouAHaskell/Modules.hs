module LearnYouAHaskell.Modules where

import Data.List as L
import Data.Char
import Data.Map as M
import Data.Set as S
-- can selectively import specific functions
-- import Data.List (nub, sort)
-- exclude function
-- import Data.List hiding (nub) 

numUniques :: (Eq a) => [a] -> Int
numUniques = length . L.nub

search :: (Eq a) => [a] -> [a] -> Bool
search str1 str2 =
    let strLength = length str1
    in L.foldl (\acc x -> if L.take strLength str2 == str1 then True else acc) False (tails str2)

encode :: Int -> String -> String
encode shift message = L.map chr $ L.map (+shift) $ L.map ord message
    -- let messageInOrd = map ord message
    --     shiftedMessageInOrd = map (+shift) messageInOrd
    -- in map chr shiftedMessageInOrd

decode :: Int -> String -> String
decode shift message = encode (negate shift) message

findKey :: (Eq k) => k -> [(k,v)] -> Maybe v
-- findKey key [] = Nothing
-- findKey key ((k,v):xs) = if k == key 
--                             then Just v
--                             else findKey key xs
findKey key = L.foldr (\(k,v) acc -> if k == key then Just v else acc) Nothing

fromList' :: (Ord k) => [(k,v)] -> M.Map k v
fromList' = L.foldr (\(k, v) acc -> M.insert k v acc) M.empty

phoneBookToMap :: (Ord k) => [(k, String)] -> M.Map k String
phoneBookToMap xs = M.fromListWith (\number1 number2 -> number1 ++ ", " ++ number2) xs