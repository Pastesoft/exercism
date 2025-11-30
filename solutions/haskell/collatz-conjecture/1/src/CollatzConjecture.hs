module CollatzConjecture (collatz) where

coll2 :: Integer -> Integer -> Maybe Integer
coll2 x n
    | x == 1 = Just n
    | x <= 0  = Nothing
    | odd x = coll2 (x * 3 + 1) (n + 1)
    | even x = coll2 (x `div` 2) (n + 1)
    | otherwise = Nothing

collatz :: Integer -> Maybe Integer
collatz n = coll2 n 0
