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

fun only_capitals LOS =
    List.filter(Char.isUpper String.sub (_,0), LOS)
val test1A = only_capitals [] = [];
val test1A = only_capitals [A, B, C] = [A, B, C];
val test1A = only_capitals [asd, ASd, dsa, Dsa] = [Asd, Dsa];
val test1A = only_capitals [a, b, c, d] = [];


	 

	       
