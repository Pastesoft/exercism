module DNA (nucleotideCounts, Nucleotide(..)) where

import Data.Map (Map)
import qualified Data.Map as Map 
import Data.Char (toUpper)

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

isNucleo :: Char -> Bool 
isNucleo 'A' = True
isNucleo 'C' = True
isNucleo 'G' = True
isNucleo 'T' = True
isNucleo _ = False

nucleoToChar :: Nucleotide -> Char 
nucleoToChar A = 'A'
nucleoToChar C = 'C'
nucleoToChar G = 'G'
nucleoToChar T = 'T'

counting :: Char -> [(Nucleotide, Int)] -> [(Nucleotide, Int)]
counting nc ms = map (\(n, i) -> if toUpper nc == nucleoToChar n then (n, i + 1) else (n, i)) ms

counter :: [Char] -> [(Nucleotide, Int)] -> Either String (Map Nucleotide Int)
counter [] acc     = Right $ Map.fromList acc 
counter (x:xs) acc = if isNucleo $ toUpper x then 
                        counter xs $ counting x acc
                     else Left "Error"

origin :: [(Nucleotide, Int)]
origin = [(A, 0), (C, 0), (G, 0), (T,0)]

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts xs = counter xs origin