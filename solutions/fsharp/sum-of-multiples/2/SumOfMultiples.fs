module SumOfMultiples

let sumOfMultiples (numbers: int list) (upperBound: int): int =
  [1..(upperBound-1)]
  |> List.collect(
      fun x -> 
        [ for y in numbers -> if x % y = 0 then Some x else None ]
        |> List.choose(fun z -> z))
  |> List.distinct
  |> List.sum