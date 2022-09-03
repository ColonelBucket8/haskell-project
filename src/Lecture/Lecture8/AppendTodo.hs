module Lecture.Lecture8.AppendTodo where

import System.IO

main :: IO ()
main = do
  putStrLn "Please add your todo list"
  todoItem <- getLine
  appendFile "todo.txt" (todoItem ++ "\n")
