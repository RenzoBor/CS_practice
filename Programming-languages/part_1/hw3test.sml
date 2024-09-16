(* Homework3 Simple Test*)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)

val test1A = only_capitals [] = [];
val test1B = only_capitals ["A", "B", "C"] = ["A", "B", "C"];
val test1C = only_capitals ["asd", "ASd", "dsa", "Dsa"] = ["ASd", "Dsa"];
val test1D = only_capitals ["a", "b", "c", "d"] = [];



val test2A = longest_string1 [] = ""
val test2B = longest_string1 ["A","nc","C"] = "nc"
val test2C = longest_string1 ["A","bc","C","cd"] = "bc"

val test3A = longest_string2 [] = ""
val test3B = longest_string2 ["A","nc","C"] = "nc"
val test3C = longest_string2 ["A","bc","C","cd"] = "cd"

val test4a = longest_string3 ["A","bc","C"] = "bc"

val test4b = longest_string4 ["A","B","C"] = "C"

val test5 = longest_capitalized ["A","bc","C"] = "A"

val test6 = rev_string "abc" = "cba"

val test7 = first_answer (fn x => if x > 3 then SOME x else NONE) [1,2,3,4,5] = 4

val test8A = all_answers (fn x => if x = 1 then SOME [x] else NONE) [2,3,4,5,6,7] = NONE
val test8B = all_answers (fn x => if x <> 1 then SOME [x] else NONE) [2,3,4,5,6,7] = SOME [2,3,4,5,6,7];
val test8C = all_answers (fn x => if x = 1 then SOME [x] else NONE) [2,3,1,4,5,6,7] = NONE;


val test9a = count_wildcards Wildcard = 1

val test9b = count_wild_and_variable_lengths (Variable("a")) = 1

val test9c = count_some_var ("x", Variable("x")) = 1

val test10 = check_pat (Variable("x")) = true

val test11 = match (Const(1), UnitP) = NONE

val test12 = first_match Unit [UnitP] = SOME []

