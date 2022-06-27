x :: Int
x = 3

sumtorial :: Integer -> Integer
sumtorial 0 = 0
sumtorial x = x + sumtorial (x-1)

f :: Int -> Int -> Int -> Int
f x y z = x + y + z

nums, range, range2 :: [Integer]
nums = [1,2,3,4]
range = [1..100]
range2 = [2,4..100]

hailstone :: Integer -> Integer
hailstone n
    | n `mod` 2 == 0 = n `div` 2
    | otherwise      = 3*n + 1

hailstoneSeq :: Integer -> [Integer]
hailstoneSeq 1 = [1]
hailstoneSeq n = n : hailstoneSeq (hailstone n)

main :: IO ()
main = do 
    print(sumtorial 3)
    print(f 1 2 5)
    print(hailstone 3)
    print(hailstoneSeq 3)
