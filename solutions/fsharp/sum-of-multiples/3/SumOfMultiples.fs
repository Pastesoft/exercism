module SumOfMultiples

let sumOfMultiples (numbers: int list) (upperBound: int): int =
  [1..(upperBound-1)]
  |> List.filter(
      fun x -> numbers |> List.exists(fun n -> x % n = 0))
  |> List.sum