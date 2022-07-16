module LearnYouAHaskell.InputAndOutput.Bytestrings where

import System.Environment
import qualified Data.ByteString.Lazy as B

main = do
    (fileName1:fileName2:_) <- getArgs
    copyFile fileName1 fileName2

copyFile :: FilePath -> FilePath -> IO ()
copyFile src dest = do
    contents <- B.readFile src
    B.writeFile dest contents
