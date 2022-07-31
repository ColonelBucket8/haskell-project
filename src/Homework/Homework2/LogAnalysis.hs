{-# OPTIONS_GHC -Wall #-}
module Homework.Homework2.LogAnalysis where

import Homework.Homework2.Log as L

toMessageType :: String -> L.MessageType 
toMessageType str 
        | str == "I" = Info
        | str == "W" = Warning
        | otherwise = let (_:code) = words str
                      in Error (read $ unwords code) 

parseMessage :: String -> L.LogMessage
parseMessage str = let (typeM:time:message) = words str
                   in LogMessage (toMessageType typeM) (read time) (unwords message)