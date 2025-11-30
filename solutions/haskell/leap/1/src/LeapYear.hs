module LeapYear (isLeapYear) where

isLeapYear :: Integer -> Bool
isLeapYear year = 
    case mod year 4 of
        0 -> if mod0 year 100 then mod0 year 400 else True -- check if /100 so need to be also /400 otherwise is /4 so is leap
        _ -> False 

    where mod0 x y = (mod x y == 0)