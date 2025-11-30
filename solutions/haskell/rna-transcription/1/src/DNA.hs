module DNA (toRNA) where

dnaStrand :: [Char]
dnaStrand = ['A','C','G','T']

dna2RNA :: Char -> Char 
dna2RNA x 
    | x == 'A' = 'U'
    | x == 'C' = 'G'
    | x == 'G' = 'C'
    | x == 'T' = 'A' 
    | otherwise = ' '

checkDNA :: (Char -> Char) -> Char -> Either Char Char
checkDNA f c
    | c `elem` dnaStrand = Right $ f c
    | otherwise = Left c

toRNA :: String -> Either Char String
toRNA [] = Right ""
toRNA xs = sequence $ map (checkDNA dna2RNA) xs 
