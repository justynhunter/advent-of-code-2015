open Aoc2015

let () = 
    let d01p1 = Day01.solve_part1 in
    print_endline ("Day 1, Part 1: " ^ (string_of_int d01p1));;

    let d01p2 = Day01.solve_part2 in
    print_endline ("Day 1, Part 2: " ^ (string_of_int d01p2));;

    let d02p1 = Day02.solve_part1 "./data/day02_data" in
    print_endline ("Day 2, Part 1: " ^ (string_of_int d02p1));;

    let d02p2 = Day02.solve_part2 "./data/day02_data" in
    print_endline ("Day 2, Part 2: " ^ (string_of_int d02p2));;


    let d03p1 = Day03.solve_part1 "./data/day03.txt" in
    print_endline ("Day 3, Part 1: " ^ (string_of_int d03p1));;

    let d03p2 = Day03.solve_part2 "./data/day03.txt" in
    print_endline ("Day 3, Part 1: " ^ (string_of_int d03p2));;
