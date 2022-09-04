module Lecture.Lecture8.RandomChars where

import System.Random
import Data.List

main :: IO ()
main = do
  gen <- getStdGen
  let randomChars = randomRs ('a', 'z') gen
      (first20, rest) = splitAt 20 randomChars
      (second20, _) = splitAt 20 rest
  putStrLn first20
  putStrLn second20
  -- another way to get new random gen
  gen <- getStdGen
  putStrLn $ take 20 (randomRs ('a', 'z') gen)
  gen' <- newStdGen
  putStrLn $ take 20 (randomRs ('a', 'z') gen')

