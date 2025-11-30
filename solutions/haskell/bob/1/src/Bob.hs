module Bob (responseFor) where
import Data.Char (isUpper, isLetter, isAlphaNum, isSpace)

isaQuestion :: String -> Bool 
isaQuestion xs = not (null xs) && head (reverse xs) == '?'

isYelling :: String -> Bool 
isYelling xs = not (null cleanx) && all isUpper cleanx
            where cleanx = filter isLetter xs
                 -- elem x ['a'..'z']) xs

callingBob :: String -> Bool 
callingBob xs = null (filter (isAlphaNum) xs)


responseFor :: String -> String
responseFor s 
    | isaQuestion as && isYelling as = "Calm down, I know what I'm doing!"
    | isaQuestion as                 = "Sure."
    | isYelling as                   = "Whoa, chill out!"
    | callingBob as                  = "Fine. Be that way!"
    | otherwise                      = "Whatever."
            where as = filter (not . isSpace) s