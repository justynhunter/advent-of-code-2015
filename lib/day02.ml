open Batteries

let parse_dims line =
    String.split_on_char 'x' line
    |> function
        | [w; h; l] -> (int_of_string w, int_of_string h, int_of_string l)
        | _ -> failwith "Invalid input"

let required_wrap (h, w, l) =
    let hw = h * w in
    let lw = w * l in
    let hl = h * l in
    (2 * lw) + (2 * hw) + (2 * hl) + (List.min [lw; hw; hl])

let solve_part1 lines =
    lines
    |> Enum.map parse_dims
    |> Enum.map required_wrap
    |> Enum.fold (+) 0

let solve_part2 =
    0
