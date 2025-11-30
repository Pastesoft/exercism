module Raindrops

let filterIt number str num = 
  if number % num = 0 then 
    Some str
  else 
    None

let convert (number: int): string = 
  let names = ["Pling"; "Plang"; "Plong"]
  let rs = 
    [3; 5; 7] 
    |> List.map2(filterIt number) names
    |> List.choose id

  match rs with 
  | [] -> sprintf "%d" number
  | ll -> String.concat "" ll