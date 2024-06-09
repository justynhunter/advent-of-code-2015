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


let get_curr_loc locs turn =
    match turn with
    | "s" -> fst locs
    | "r" -> snd locs
    | _ -> failwith "Invalid turn"

let update_curr_loc locs new_loc turn =
    match turn with
    | "s" -> (new_loc, snd locs)
    | "r" -> (fst locs, new_loc)
    | _ -> failwith "Invalid turn"

let do_move dir loc =
    match dir with
    | '<' -> (fst loc - 1, snd loc)
    | '>' -> (fst loc + 1, snd loc)
    | 'v' -> (fst loc, snd loc + 1)
    | '^' -> (fst loc, snd loc - 1)
    | _ -> failwith "Invalid direction"

let switch_turn turn =
    match turn with
    | "s" -> "r"
    | "r" -> "s"
    | _ -> failwith "Invalid turn"

let rec count_houses_robo history locs turn dirs =
    let curr_loc = get_curr_loc locs turn in
    match dirs with
    | dir :: rest ->
        let new_loc = do_move dir curr_loc in
        if List.mem new_loc history then count_houses_robo history (update_curr_loc locs new_loc turn) (switch_turn turn) rest
        else count_houses_robo (new_loc :: history) (update_curr_loc locs new_loc turn) (switch_turn turn) rest
    | [] -> List.length history

let solve_part1 file_path =
    file_path
    |> File.lines_of
    |> Enum.fold (^) ""
    |> explode
    |> count_houses [] (0, 0)


let solve_part2 file_path =
    file_path
    |> File.lines_of
    |> Enum.fold (^) ""
    |> explode
    |> count_houses_robo [] ((0, 0), (0, 0)) "s"
