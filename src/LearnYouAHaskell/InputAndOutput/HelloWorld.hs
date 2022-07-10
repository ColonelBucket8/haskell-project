module LearnYouAHaskell.InputAndOutput.HelloWorld where

-- An I/O action is something that, when performed, will carry out
-- an action with a side-effect (that's usually either reading from the input or printing stuff to the screen)
-- and will also contain some kind of return value inside it
-- putStrLn :: String -> IO ()

reverseWords :: String -> String
reverseWords = unwords . map reverse . words

-- Using return doesn't cause the I/O do block to end in execution
-- or anything like that
-- return is sort of the opposite to <-
-- While return takes a value and wraps it up in a box, <- takes a box
-- (and performs it) and takes the value out of it, binding it to a name
-- main = do
--     a <- return "hell"
--     b <- return "yeah"
--     putStrLn $ a ++ " " ++ b

-- putStr :: String -> IO ()
-- putStr [] = return ()
-- putStr (x:xs) = do
--     putChar x
--     putStr xs

-- print is just putStrLn . show


    -- -- Loop reverse string
    -- line <- getLine
    -- if null line 
    --     then return ()
    --     else do
    --         putStrLn $ Hello.reverseWords line
    --         main
    
    -- -- putChar
    -- c <- getChar
    -- when (c /= ' ') $ do
    --     putChar c
    --     main

    -- -- forM
    -- colors <- forM [1,2,3,4] (\a -> do
    --     putStrLn $ "Which color do you associate with the number " ++ show a ++ "?"
    --     color <- getLine
    --     return color)
    -- putStrLn "The colors that you associate with 1, 2, 3 and 4 are: "
    -- mapM putStrLn colors
     
    
    