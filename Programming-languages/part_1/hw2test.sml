(* Homework2 Simple Test *)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)

val test1A = all_except_option ("string", ["string"]) = SOME []
val test1B = all_except_option("a", []) = NONE
vla test1C = all_except_option("asd", ["qwe", "asd", "plt"]) = SOME ["qwe", "plt"]
val test1D = all_except_option("asd", ["plt", "foo", "som"]) = NONE

val test2A = get_substitutions1([["foo"],["there"]], "foo") = [];
val test2B = get_substitutions1([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]],"Fred") = ["Fredrick","Freddie","F"];
val test2C = get_substitutions1([["Fred","Fredrick"],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]],"Jeff") = ["Jeffrey","Geoff","Jeffrey"];
						

val test3 = get_substitutions2 ([["foo"],["there"]], "foo") = []

val test4 = similar_names ([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], {first="Fred", middle="W", last="Smith"}) =
	    [{first="Fred", last="Smith", middle="W"}, {first="Fredrick", last="Smith", middle="W"},
	     {first="Freddie", last="Smith", middle="W"}, {first="F", last="Smith", middle="W"}]

val test5A = card_color (Clubs, Num 2) = Black
val test5B = card_color (Spades, Num 8) = Black
val test5C = card_color (Diamonds, Ace) = Red
val test5D = card_color (Hearts, King) = Red;

val test6 = card_value (Clubs, Num 2) = 2

val test7 = remove_card ([(Hearts, Ace)], (Hearts, Ace), IllegalMove) = []

val test8 = all_same_color [(Hearts, Ace), (Hearts, Ace)] = true

val test9 = sum_cards [(Clubs, Num 2),(Clubs, Num 2)] = 4

val test10A = score ([(Hearts, Num 2),(Clubs, Num 4)],10) = 4
val test10B = score ([(Hearts, Jack)],10) = 0
val test10C = score ([(Hearts, Num 8),(Clubs, Num 4)],10) = 6
val test10D = score ([(Hearts, Num 2),(Diamonds, Num 3)],10) = 2
val test11 = officiate ([(Hearts, Num 2),(Clubs, Num 4)],[Draw], 15) = 6

val test12 = officiate ([(Clubs,Ace),(Spades,Ace),(Clubs,Ace),(Spades,Ace)],
                        [Draw,Draw,Draw,Draw,Draw],
                        42)
             = 3

val test13 = ((officiate([(Clubs,Jack),(Spades,Num(8))],
                         [Draw,Discard(Hearts,Jack)],
                         42);
               false) 
              handle IllegalMove => true)
             
             
