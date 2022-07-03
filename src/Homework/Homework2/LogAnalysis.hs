{-# OPTIONS_GHC -Wall #-}
module Homework.Homework2.LogAnalysis where

import Homework.Homework2.Log as L

parseMessage :: [ String ] -> L.LogMessage
parseMessage ("E":error:timestamp:message) = L.LogMessage (L.Error (read error)) (read timestamp) ( unwords message )
