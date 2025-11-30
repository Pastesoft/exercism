module Bob

open System

// Keep only the meaningful chars
let CleanStr s = 
  (s |> String.filter(fun x -> Char.IsLetter(x))).Trim()

let (|IsQuestion|_|) (q: string) =
  match q.EndsWith "?" with 
  | true -> Some ()
  | false -> None

let (|IsYelling|_|) (y : string) = 
  let y2 = y |> CleanStr
  if(y2 |> String.length > 0) then 
    let s2 = y2.ToUpper()
    let r = System.String.Equals(y2, s2)
    match r with 
    | true -> Some ()
    | false -> None
  else
    None

let (|IsYellQuery|_|) (yq : string) = 
  match yq with 
  | IsYelling _ & IsQuestion _ -> Some ()
  | _ -> None

let (|IsEmptyQuery|_|) (eq : string) =
  match (eq |> String.length) with
  | 0 -> Some()
  |_ -> None


let response (input: string): string =
  match input.Trim() with 
  | IsEmptyQuery _ -> "Fine. Be that way!"
  | IsYellQuery _ -> "Calm down, I know what I'm doing!"
  | IsYelling _ -> "Whoa, chill out!"
  | IsQuestion _ -> "Sure."
  | _ -> "Whatever."