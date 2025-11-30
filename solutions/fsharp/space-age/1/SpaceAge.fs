module SpaceAge
open System

type Planet =
  | Earth
  | Mercury
  | Venus
  | Mars
  | Jupiter
  | Saturn
  | Uranus
  | Neptune

// let EarthYear = 31557600 |> decimal
let EarthYear = 1 |> decimal

let calculateYear (p : Planet) : decimal = 
  match p with 
  | Earth -> EarthYear
  | Mercury -> EarthYear * 0.2408467M
  | Venus -> EarthYear * 0.61519726M
  | Mars -> EarthYear * 1.8808158M
  | Jupiter -> EarthYear * 11.862615M
  | Saturn -> EarthYear * 29.447498M
  | Uranus -> EarthYear * 84.016846M
  | Neptune -> EarthYear * 164.79132M


let secToYear (s : decimal) = 
  s / 3600m / 24m / 365.25m

let spaceAge (planet: Planet) (seconds: decimal): decimal = 
  planet
  |> calculateYear
  |> (*) seconds
  |> secToYear