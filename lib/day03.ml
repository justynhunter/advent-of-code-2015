open Batteries

let explode s =
    let rec exp i l =
        if i < 0 then l else exp (i - 1) (s.[i] :: l) in
    exp (String.length s - 1) []

let rec count_houses history curr dirs =
    match dirs with
    | dir :: rest ->
        let new_loc =
            match dir with
            | '<' -> (fst curr - 1, snd curr)
            | '>' -> (fst curr + 1, snd curr)
            | 'v' -> (fst curr, snd curr + 1)
            | '^' -> (fst curr, snd curr - 1)
            | _ -> (fst curr, snd curr)
        in
        if List.mem new_loc history then count_houses history new_loc rest
        else count_houses (new_loc :: history) new_loc rest
    | [] -> List.length history

let solve_part1 file_path =
    file_path
    |> File.lines_of
    |> Enum.fold (^) ""
    |> explode
    |> count_houses [] (0, 0)
