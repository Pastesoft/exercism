module SumOfMultiples (sumOfMultiples) where

import Data.List(nub)

-- determine all the multiples of a number that are less than the limit
sumElems :: Integer -> Integer -> [Integer]
sumElems n limit 
    | n > 0 = takeWhile (< limit) (map (* n) [1..])
    | otherwise = []

-- collect all the multiples, merge together in a sinle list and remove duplicates
collectElems :: [Integer] -> Integer -> [Integer] -> [Integer]
collectElems [] _ acc = nub acc  -- get only unique elements
collectElems (x:xs) limit acc = collectElems xs limit newacc
                                where newacc = sumElems x limit ++ acc

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples xs limit = sum $ collectElems xs limit []