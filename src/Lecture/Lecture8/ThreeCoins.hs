module Lecture.Lecture8.ThreeCoins where

import System.Random 

threeCoins :: StdGen -> (Bool, Bool, Bool)
threeCoins gen = 
  let (firstCoin, newGen) = random gen
      (secondCoin, newGen') = random newGen
      (thirdCoin, newGen'') = random newGen'
  in (firstCoin, secondCoin, thirdCoin)

-- randoms' :: (Random g, Random a) => g -> [a]
-- randoms' gen = 
--   let (value, newGen) = random gen
--   in value:randoms' newGen

finiteRandoms :: (RandomGen g, Random a, Num n, Eq n) => n -> g -> ([a], g)
finiteRandoms 0 gen = ([], gen)
finiteRandoms n gen =
  let (value, newGen) = random gen
      (restOfList, finalGen) = finiteRandoms (n-1) newGen
  in  (value:restOfList, finalGen)

main :: IO () 
main = do
  print $ threeCoins (mkStdGen 21)
  -- print $ finiteRandoms 4 (mkStdGen 22)
  -- print $ take 5 . randoms $ mkStdGen 11
  gen <- getStdGen
  putStr $ take 20 (randomRs ('a', 'z') gen)
