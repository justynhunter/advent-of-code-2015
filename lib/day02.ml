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

let ribbon_length (h, w, l) =
    let ribbon = h * w * l in
    let hw = h + w in
    let lw = l + w in
    let hl = h + l in
    let p = min hw (min lw hl) in
    ribbon + (2 * p)

let solve_part1 lines =
    lines
    |> Enum.map parse_dims
    |> Enum.map required_wrap
    |> Enum.fold (+) 0

let solve_part2 lines =
    lines
    |> Enum.map parse_dims
    |> Enum.map ribbon_length
    |> Enum.fold (+) 0
