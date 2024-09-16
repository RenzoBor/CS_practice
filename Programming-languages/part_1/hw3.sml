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

fun longest_string_helper (fn (n1, n2) => if fn LOS
					  then n1
					       else s2=> )
	
val test4a = longest_string3 ["A","bc","C"] = "bc"
val test4a = longest_string3 ["A","bc","C"] = "bc"
val test4a = longest_string3 ["A","bc","C"] = "bc"
val test4b = longest_string4 ["A","B","C"] = "C"

						 (**)
						 
						 
	 

	       
