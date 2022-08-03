{-# OPTIONS_GHC -Wall #-}
module Homework.Homework2.LogAnalysis where

import Homework.Homework2.Log

parseMessage :: String -> LogMessage
parseMessage str = case words str of
                        ("I":time:message)       -> LogMessage Info (read time) (unwords message)
                        ("W":time:message)       -> LogMessage Warning (read time) (unwords message)
                        ("E":code:time:message)  -> LogMessage ( Error (read code) ) (read time) (unwords message)
                        (message)                -> Unknown (unwords message)

parse :: String -> [LogMessage]
parse files = map parseMessage (lines files)

insert :: LogMessage -> MessageTree -> MessageTree 
insert (Unknown _) tree = tree 
insert msg Leaf = Node Leaf msg Leaf
insert msg@(LogMessage _ time _) (Node l msgT@(LogMessage _ timestamp _) r)
        | time > timestamp = Node l msgT (insert msg r)
        | time < timestamp = Node (insert msg l) msgT r
        
buildRecursive :: [LogMessage] -> MessageTree -> MessageTree
buildRecursive [] tree = tree
buildRecursive (logM:xs) tree = buildRecursive xs ( insert logM tree )

build :: [LogMessage] -> MessageTree
build logs = buildRecursive logs Leaf

inOrder :: MessageTree -> [LogMessage]
inOrder Leaf = []
inOrder (Node l logM r) = inOrder l ++ [logM] ++ inOrder r

whatWentWrong :: [LogMessage] -> [String]
whatWentWrong (Unknown _:xs) = whatWentWrong xs
whatWentWrong ((LogMessage _ timestamp message):xs)
        | timestamp > 50 = message : whatWentWrong xs 
        | otherwise      = whatWentWrong xs
                


main :: IO [String] 
main = do
--        print $ inOrder . build $ testParse parse 10 "error.log" 
        testWhatWentWrong parse whatWentWrong "error.log"