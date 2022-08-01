{-# OPTIONS_GHC -Wall #-}
module Homework.Homework2.LogAnalysis where

import Homework.Homework2.Log as L

parseMessage :: String -> [L.LogMessage]
parseMessage str = case words str of
                        ("I":time:message)       -> [LogMessage Info (read time) (unwords message)]
                        ("W":time:message)       -> [LogMessage Warning (read time) (unwords message)]
                        ("E":code:time:message)  -> [LogMessage ( Error (read code) ) (read time) (unwords message)]
                        (message)                -> [Unknown (unwords message)]

insert :: L.LogMessage -> L.MessageTree -> L.MessageTree 
insert (Unknown _) tree = tree 
insert msg Leaf = Node Leaf msg Leaf
insert msg@(LogMessage _ time _) (Node l msgT@(LogMessage _ timestamp _) r)
        | time > timestamp = Node l msgT (insert msg r)
        | time < timestamp = Node (insert msg l) msgT r