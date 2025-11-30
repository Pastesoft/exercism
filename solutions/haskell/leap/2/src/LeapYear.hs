module LeapYear (isLeapYear) where

isLeapYear :: Integer -> Bool
isLeapYear year
    | mod0 400   = True
    | mod0 100   = False
    | mod0 4     = True
    | otherwise  = False

    where mod0 y = (mod year y == 0)