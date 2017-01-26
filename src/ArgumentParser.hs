module ArgumentParser
  (
    parseInput
  )
  where

import Data.Char
import System.Environment
import System.IO.Error
import Control.Exception
import FileManager
import Primes
import RSA

-- | Tutaj cos przetestujemy haddock
parseInput = do
  (option:_) <- getArgs
  (option:inFileName:outFileName:key:modulus:_) <- getArgs
  case () of _
               | option == "g" -> do
                   s <- getRSAKeyPairs
                   (putStrLn . showDetails) s
               | option == "e" -> do
                 result <- try $ rewriteFile inFileName outFileName $ encryptText (getKey key) (getKey modulus)
                 case result of
                   Left ex -> exHdlr ex
                   Right _ -> putStrLn "completed"
               | option == "d" -> do
                 result <- try $ rewriteFile inFileName outFileName $ decryptText (getKey key) (getKey modulus)
                 case result of
                       Left ex -> exHdlr ex
                       Right _ -> putStrLn "completed"
               | otherwise     -> putStrLn "Help"

showDetails :: ((Integer, Integer),(Integer,Integer)) -> String
showDetails ((a,b),(c,d)) = "Klucz publiczny:" ++ show (a,b) ++ "\n" ++ "Klucz prywatny:" ++ show (c,d)

exHdlr :: IOError -> IO ()
exHdlr = \ex -> if isDoesNotExistError ex
                then putStrLn "The file doesn't exist!"
                else ioError ex

getKey :: [Char] -> Int
getKey input = let key = getFirstElem input
  in convertStringToInt key 0

convertStringToInt :: [Char]-> Int -> Int
convertStringToInt (x:xs) acc = convertStringToInt xs (acc * 10 + digitToInt x)
convertStringToInt _ acc = acc

getFirstElem :: [Char] -> [Char]
getFirstElem (x:xs) = if (isDigit x == False)
    then []
    else [x] ++ getFirstElem xs
getFirstElem _ = []
