module Main where

import Data.Char
import Data.Monoid
import Control.Monad
import Control.Monad.Writer
import Geometry as Geometry
import System.Random

import Lecture.IntroductionToHaskell
import Lecture.AlgebraicDataTypes

import LearnYouAHaskell.StartingOut as Starting
import LearnYouAHaskell.TypesAndTypeclasses as Types
import LearnYouAHaskell.SyntaxInFunctions as Syntax
import LearnYouAHaskell.Recursion as Recursion
import LearnYouAHaskell.HigherOrderFunctions as Higher
import LearnYouAHaskell.Modules as Modules
import LearnYouAHaskell.MakingOurOwnTypesAndTypeclasses.Shape as Shape
import LearnYouAHaskell.MakingOurOwnTypesAndTypeclasses.RecordSyntax as Record
import LearnYouAHaskell.MakingOurOwnTypesAndTypeclasses.TypeParameters as TypeParam
import LearnYouAHaskell.MakingOurOwnTypesAndTypeclasses.DerivedInstances as Derived
import LearnYouAHaskell.MakingOurOwnTypesAndTypeclasses.TypeSynonyms as TypeSynonyms
import LearnYouAHaskell.MakingOurOwnTypesAndTypeclasses.RecursiveDataStructures as Recursive
import LearnYouAHaskell.MakingOurOwnTypesAndTypeclasses.Typeclasses102 as Typeclasses
import LearnYouAHaskell.MakingOurOwnTypesAndTypeclasses.AYesNoTypeclass as AYesNo
import LearnYouAHaskell.MakingOurOwnTypesAndTypeclasses.TheFunctorTypeclass as TheFunctor
import LearnYouAHaskell.MakingOurOwnTypesAndTypeclasses.KindsAndSomeTypeFoo as Kinds
import LearnYouAHaskell.InputAndOutput.HelloWorld as Hello
import LearnYouAHaskell.InputAndOutput.FilesAndStreams as Files
import LearnYouAHaskell.InputAndOutput.CommandLineArguments as Command
import LearnYouAHaskell.InputAndOutput.Randomness as Randomness
import LearnYouAHaskell.InputAndOutput.Bytestrings as Bytestrings
import LearnYouAHaskell.InputAndOutput.Exceptions as Exceptions
import LearnYouAHaskell.FunctionallySolvingProblems.ReversePolishNotationCalculator as ReversePolish
import LearnYouAHaskell.FunctionallySolvingProblems.HeathrowToLondon as Heathrow
import LearnYouAHaskell.FunctorsApplicativeMonoids.FunctorsRedux as Functors
import LearnYouAHaskell.FunctorsApplicativeMonoids.ApplicativeFunctors as ApplicativeFunctors
import LearnYouAHaskell.FunctorsApplicativeMonoids.NewtypeKeyword as Newtype
import LearnYouAHaskell.FunctorsApplicativeMonoids.Monoids as Monoids
import LearnYouAHaskell.AFistfulOfMonads.GettingOurFeetWetWithMaybe as Getting
import LearnYouAHaskell.AFistfulOfMonads.TheMonadTypeClass as TheMonad
import LearnYouAHaskell.AFistfulOfMonads.WalkTheLine as WalkTheLine
import LearnYouAHaskell.AFistfulOfMonads.DoNotation as DoNotation
import LearnYouAHaskell.AFistfulOfMonads.TheListMonad as TheList
-- import LearnYouAHaskell.AFistfulOfMonads.MonadLaws as MonadLaws
import LearnYouAHaskell.ForAFewMonadsMore.Writer as Writer

import Homework.Homework1
import Homework.Homework2.LogAnalysis

main :: IO ()
-- main = forever $ do 
main = do 
    -- print $ Modules.numUniques [1,2,2,3,1,5]
    -- print $ Modules.search "Cat" "Cat in the jungle"
    -- print $ Modules.encode 3 "Hello world!"
    -- print $ Modules.decode 3 "Khoor#zruog$"
    -- print $ Modules.findKey "anne" [("ezzy","1234"),("anne","81824"),("bob", "191234")]
    -- print $ Modules.fromList' [(1,2),(3,4)]
    -- print $ Modules.phoneBookToMap [("ezzy","1234"),("anne","81824"),("bob", "191234"),("ezzy","1234"),("anne","81824"),("bob", "191234")]
    -- print $ Geometry.cubeVolume 5
    -- print $ Shape.surface (Circle  ( Point  4.0 3.0 )  5.0)
    -- print $ Shape.surface (Rectangle ( Point 2.0 3.0 )  ( Point 4.0 2.0 ))
    -- print $ Shape.nudge (Circle (Point 4.0 3.0) 5.0) 2.0 2.0
    -- print $ Shape.nudge (Rectangle (Point 2.0 3.0) (Point 4.0 2.0)) 2.0 2.0
    -- print $ Shape.nudge (Shape.baseCircle 5.0) 60 23
    -- print $ Shape.baseRect 2.0 3.0
    -- let guy = Record.Person "guy" "buddy" 12 160.5 "12356" "vanilla"
    -- print $ Record.firstName guy
    -- let vectorA = Vector 1 2 3
    -- let vectorB = Vector 4 5 6
    -- print $ TypeParam.addVector vectorA vectorB
    -- print $ TypeParam.multiplyVector vectorA 2
    -- print $ TypeParam.scalarMult vectorA vectorB
    -- print $ Wednesday
    -- let phoneBook = [("ezzy","1234"),("anne","81824"),("bob", "191234")]
    -- print $ TypeSynonyms.inPhoneBook "ezzy" "12" phoneBook
    -- print $ TypeSynonyms.inPhoneBook "ezzy" "1234" phoneBook
    -- print $ TypeSynonyms.lockers
    -- print $ TypeSynonyms.lockerLookup 101 TypeSynonyms.lockers 
    -- print $ TypeSynonyms.lockerLookup 109 TypeSynonyms.lockers 
    -- print $ TypeSynonyms.lockerLookup 120 TypeSynonyms.lockers 
    -- let nums = [1,2,3,4,5,6,2,1,3,4]
    -- print $ foldr treeInsert EmptyTree nums
    -- print $ AYesNo.yesno $ length []
    -- print $ AYesNo.yesno $ Green 
    -- print $ AYesNo.yesno $ Red 
    -- print $ AYesNo.yesnoIf [] "YEAH!" "NO"
    -- print $ fmap (*2) [1,2,3]
    -- Basic getLine
    -- putStrLn "Hello, what's your name"
    -- name <- getLine
    -- let uppercaseName = map toUpper name
    -- putStrLn ("Hey " ++ uppercaseName ++ ", you suck!") 
    -- putStr "Give me some input: "
    -- input <- getLine
    -- putStrLn $ map toUpper input
    -- contents <- getContents
    -- putStr $ Files.shortLinesOnly contents
    -- print $ Randomness.threeCoins (mkStdGen 21)
    -- gen <- getStdGen
    -- putStr $ take 20 $ randomRs ('a', 'z') gen
    -- gen <- getStdGen
    -- Randomness.askForNumber gen
    -- print $ ReversePolish.solveRPN "10 3 4 + 2 * -"
    -- print $ Heathrow.optimalPath Heathrow.heathrowToLondon
    print $ ApplicativeFunctors.sequenceB [(>4), (<10), even] 7
    print $ Newtype.CharList "This will be shown!"
    print $ getPair $ fmap (*100) ( Pair (2,3) )
    print $ Newtype.helloMe ( CoolBool True ) 
    print $ [1,2,3] `mappend` [4,5,6]
    print $ Monoids.lengthCompare2 "abuasdf" "ubaa"
    print $ Monoids.lengthCompare3 "zen" "ann"
    print $ Getting.applyMaybe ( Just 3 ) (\x -> Just (x + 3))
    print $ Just 9 >>= \x -> return (x * 3)
    print $ WalkTheLine.landLeft 3 (1,0)
    print $ WalkTheLine.landLeft2 4 (3,0)
    print $ WalkTheLine.landLeft2 1 (0,0) >>= WalkTheLine.landLeft2 3
    print $ WalkTheLine.landRight2 3 (0,0) >>= WalkTheLine.landLeft2 2
    print $ return (0,0) >>= WalkTheLine.landRight2 2 >>= WalkTheLine.landLeft2 2 >>= WalkTheLine.landRight2 2
    print $ Just 3 >>= (\x -> Just "!" >>= (\y -> Just ( show x ++ y)))
    print $ DoNotation.routine
    print $ DoNotation.justH
    print $ DoNotation.wopwop
    print $ (*) <$> [1,2,3] <*> [10,100,1000]
    print $ [3,4,5] >>= \x -> [x,-x]
    print $ [1,2] >>= \x -> ['a', 'b'] >>= \char -> return ( x,char )
    print $ TheList.sevensOnly 
    print $ TheList.moveKnight (6,2)
    print $ TheList.moveKnight (11,22)
    print $ TheList.in3 (6,2)
    print $ TheList.canReachIn3 (6,2) (6,1)
    print $ TheList.canReachIn3 (6,2) (7,3)
    print $ Writer.isBigGang2 5
    print $ Writer.applyLog (6, "Small gang.") isBigGang2
    print $ ("Tobin", "Got outlaw name") `Writer.applyLog` (\x -> (length x, "Applied length."))
    print $ Writer.applyLog' ("beans", Sum 10) addDrink 
    print $ ("beans", Sum 10) `Writer.applyLog'` addDrink  `Writer.applyLog'` addDrink
    print $ Writer.gcd' 8 4
    print $ fst $ runWriter $ Writer.gcd2' 8 4
    mapM_ putStrLn $ snd $ runWriter $ Writer.gcd2' 8 3
    print $ Writer.fromDiffList (Writer.toDiffList [1,2,3,4] `mappend` Writer.toDiffList [1,2,3])
    -- mapM_ putStrLn . fromDiffList . snd . runWriter $ Writer.finalCountDown 100000
    mapM_ putStrLn . snd . runWriter $ Writer.normalFinalCountDown 100000

