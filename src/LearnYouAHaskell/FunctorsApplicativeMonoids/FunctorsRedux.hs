module LearnYouAHaskell.FunctorsApplicativeMonoids.FunctorsRedux where

import Data.Char
import Data.List

-- main = do
--     line <- fmap reverse getLine
--     putStrLn $ "You said " ++ line ++ " backwards!"
--     putStrLn $ "Yes, you really said "  ++ line ++ " backwards"
    
main = do line <- fmap (intersperse '-' . reverse . map toUpper) getLine
          putStrLn line
