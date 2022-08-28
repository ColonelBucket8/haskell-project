module Lecture.Lecture8.GetCharTest where
    
import Control.Monad
main :: IO ()
main = do
    c <- getChar
    if c /= ' '
       then do
           putChar c
           main
       else return ()

-- With when
-- main :: IO ()
-- main = do
--     c <- getChar
--     when (x /= ' ') $ do
--         putChar c
--         main
