module Homework.Homework7.StringBufEditor where

import Homework.Homework7.StringBuffer
import Homework.Homework7.Editor

main = runEditor editor $ unlines
         [ "This buffer is for notes you don't want to save, and for"
         , "evaluation of steam valve coefficients."
         , "To load a different file, type the character L followed"
         , "by the name of the file."
         ]
