module Accumulate

let accumulate<'a, 'b> (func: 'a -> 'b) (input: 'a list): 'b list =
  let rec inner al acc = 
    match al with 
    | x :: xs -> (x |> func) :: acc 
                 |> inner xs
    | _ -> acc |> List.rev

  inner input List.Empty