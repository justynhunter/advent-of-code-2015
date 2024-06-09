open Aoc2015

let () = 
    let d01p1 = Day01.solve_part1 in
    print_endline ("Day 1, Part 1: " ^ (string_of_int d01p1));;

    let d01p2 = Day01.solve_part2 in
    print_endline ("Day 1, Part 2: " ^ (string_of_int d01p2));;

    let d02p1 = Day02.solve_part1 "./data/day02_data"  in
    print_endline ("Day 2, Part 1: " ^ (string_of_int d02p1));;

    let d02p2 = Day02.solve_part2 "./data/day02_data"  in
    print_endline ("Day 2, Part 2: " ^ (string_of_int d02p2));;
