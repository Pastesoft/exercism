module Raindrops

let convert (number: int): string = 
  let names = ["Pling"; "Plang"; "Plong"]
  let rs = 
    [3; 5; 7] 
    |> List.map2(fun str x -> if number % x = 0 then str else "") names
    |> List.fold(fun acc x -> acc + x) ""

  if rs.Length > 0 then
    rs
  else 
    sprintf "%d" number