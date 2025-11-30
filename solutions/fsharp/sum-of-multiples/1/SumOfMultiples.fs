module SumOfMultiples

let sumOfMultiples (numbers: int list) (upperBound: int): int =
  if upperBound > 0 then 
    let range = [1..(upperBound-1)]

    numbers
    |> List.map(
      fun x -> range |> List.filter(fun y -> y % x = 0))
    |> List.collect(fun x -> x)
    |> List.distinct 
    |> List.sum
  else
    0