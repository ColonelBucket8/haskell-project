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

-- logM :: String
-- logM = ["I 5053 pci_id: con ing!",
--         "I 4681 ehci 0xf43d000:15: regista14: [0xbffff 0xfed nosabled 00-02] Zonseres: brips byted nored)",
--         "W 3654 e8] PGTT ASF! 00f00000003.2: 0x000 - 0000: 00009dbfffec00000: Pround/f1743colled"
--         ]

-- main :: IO () 
-- main = do
--        print $ inOrder . build $ testParse parse 10 "error.log" 
        -- print $ inOrder . build $ parse logM