module Lecture.Lecture8.InputMonad where

main :: IO ()
main = putStrLn "Greetings! What is your name?" >>
       getLine >>=
       (\inpStr -> putStrLn $ "Welcome to Haskell, " ++ inpStr ++ "!")
