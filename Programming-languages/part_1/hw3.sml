(* Coursera Programming Languages, Homework 3, Provided Code *)

exception NoAnswer

datatype pattern = Wildcard
		 | Variable of string
		 | UnitP
		 | ConstP of int
		 | TupleP of pattern list
		 | ConstructorP of string * pattern

datatype valu = Const of int
	      | Unit
	      | Tuple of valu list
	      | Constructor of string * valu

fun g f1 f2 p =
    let 
	val r = g f1 f2 
    in
	case p of
	    Wildcard          => f1 ()
	  | Variable x        => f2 x
	  | TupleP ps         => List.foldl (fn (p,i) => (r p) + i) 0 ps
	  | ConstructorP(_,p) => r p
	  | _                 => 0
    end

(**** for the challenge problem only ****)

datatype typ = Anything
	     | UnitT
	     | IntT
	     | TupleT of typ list
	     | Datatype of string;

(**** you can put all your code here ****)
(*Problem 1: *)
(*(listOf String) -> (listOf String)*)
(*Recieve a LOS and produce a LOS made of the items that starts with an uppercase*)

(*fun only_capitals LOS =
    List.filter(fn s => Char.isUpper(String.sub(s, 0)) , LOS)*)
fun only_capitals LOS =
    List.filter (fn s => Char.isUpper (String.sub (s, 0))) LOS;
	       
(*Problem 2: *)
(*(listOf String) -> String*)
(*Recieve a LOS and produce the longest String in the list. In case of tie, the first longest*)

fun longest_string1 LOS =
    List.foldl(fn (s1, s2) =>if String.size s1 > String.size s2
			     then s1
			     else s2) "" LOS;

(*Problem 3: *)
(*Same as before, but in case of tie produce the last longest*)

fun longest_string2 LOS =
    List.foldl(fn (s1, s2) =>if String.size s1 >= String.size s2
			     then s1
			     else s2) "" LOS;
						 
(*Problem 4: *)
(*(Number Number -> Boolean) -> LOS -> String*)

val longest_string_helper = fn func => fn LOS => List.foldl(fn (s1, s2) => if func(String.size s1, String.size s2)then s1 else s2) "" LOS;

val func1 = fn (x, y) =>  x > y
val func2 = fn (x, y) => x >= y;

fun longest_string3 LOS =
    longest_string_helper func1 LOS;

fun longest_string4 LOS =
    longest_string_helper func2 LOS;

(*Problem 5: *)
(*(listOf String) -> String*)
(*Recieve a LOS and produce the longest string that starts with a capital letter*)
val longest_capitalized = longest_string1 o only_capitals;


(*Problem 6: *)
(*Recieve a String and produce the same string but in reverse*)

fun rev_string str =
    (String.implode o List.rev o String.explode) str;

(*Problem 7: *)

fun first_answer func list =
    case list of
	[] => raise NoAnswer
      | x :: xs => (case func x of
			NONE => first_answer func xs
		      | SOME v  => v);
(*Problem 8: *)
fun all_answers func list =
    let
	fun all_answers_helper (list, acc) =
	    case list of
		[] => SOME acc
	      | x::xs  => let val result = func x
			  in case result of
			       NONE => NONE
			      | SOME y =>  all_answers_helper(xs, acc @ y)
			  end
    in
	all_answers_helper(list, [])
    end;

(*Problem 9 a : *)
(*Pattern -> Integer*)
(*A function that recieve a pattern and produce the number of wildcards it contains*)
fun count_wildcards p =
    g





			

						
