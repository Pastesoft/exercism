module Raindrops

let convert (number: int): string = 
  let names = ["Pling"; "Plang"; "Plong"]
  let rs = 
    [3; 5; 7] 
    |> List.map2(fun str x -> if number % x = 0 then Some str else None) names
    |> List.choose(fun x -> x)

  match rs with 
  | [] -> sprintf "%d" number
  | ll -> String.concat "" ll