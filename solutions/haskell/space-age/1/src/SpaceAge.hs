module SpaceAge (Planet(..), ageOn) where

data Planet = Mercury
            | Venus
            | Earth
            | Mars
            | Jupiter
            | Saturn
            | Uranus
            | Neptune

secYears :: Float
secYears = 31557600.0

earthYear :: Planet -> Float
earthYear p =
    case p of 
        Mercury -> 0.2408467
        Venus   -> 0.61519726
        Earth   -> 1.0
        Mars    -> 1.8808158
        Jupiter -> 11.86261
        Saturn  -> 29.447498
        Uranus  -> 84.016846
        Neptune -> 164.79132

ageOn :: Planet -> Float -> Float
ageOn p sec = (sec / secYears) * (1/earthYear p) 

