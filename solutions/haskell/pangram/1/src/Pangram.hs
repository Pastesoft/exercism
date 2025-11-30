module Pangram (isPangram) where

import Data.Char (toLower)

singleTon :: Ord a => [a] -> [a]
singleTon xs = foldr (\x s -> if (elem x s) then s else (x : s)) [] xs

isPangram :: String -> Bool
isPangram text = 
    length(singleTon cleantext) == 26
    where
        cleantext = filter (\x -> elem x ['a'..'z']) lowText
        lowText = map toLower text