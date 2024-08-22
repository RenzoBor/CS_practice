(* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2;

(* put your solutions for problem 1 here *)

(*Problem a:*)
(*String (listOf String) -> Option*)
(*Recieve a String and a los and produce NONE if the string is not on the list, else SOME listOfString without the given string*)
fun all_except_option(str, los0) =
    let fun helper(los, acc) =
	    case los of
		[] => NONE
	      | x::xs => if same_string(x, str)
			 then SOME (acc @ xs)
			 else helper(xs, x :: acc)
    in
	helper(los0, [])
    end;

(*Problem b:*)
(*(listOf (listOf String)) String -> (listOf String)*)
(*recieve a list of list of string and a string and produce a list of strings that are all the stings in each los that contains the s but the s*)
fun get_substitutions1(substitutions, s) =
    case substitutions of
	[] => []
      | x :: xs => let val result = all_except_option(s, x)
		   in case result of
			  NONE => get_substitutions1(xs, s)
			| SOME y => y @ get_substitutions1(xs, s)
		   end;
	 

val test2A = get_substitutions1([["foo"],["there"]], "foo") = [];
val test2B = get_substitutions1([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]],"Fred") = ["Fredrick","Freddie","F"];
val test2C = get_substitutions1([["Fred","Fredrick"],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]],"Jeff") = ["Jeffrey","Geoff","Jeffrey"];
								   
														 

								  
		  
(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove

(* put your solutions for problem 2 here *)
