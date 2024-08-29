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

(*Problem c:*)
(*Same as problem b but it uses a tail-recursive local helper function*)

fun get_substitutions2(substitutions0, s) =
    let fun helper(substitutions, acc) =
	case substitutions of
	    [] => acc
	  | x :: xs => let val result = all_except_option(s, x)
		       in case result of
			      NONE => helper(xs, acc)
			    | SOME y => helper(xs, acc @ y)
		       end;
    in helper(substitutions0, [])
    end;

(*(listof (listof strings)) name(string, string,string) -> (listof Name)*)
(*Recieve a List of substitutions and a name, and produce a list of names where only the first name is changed by the substitution function*)

fun similar_names(substitutions, name) =
    let val names = get_substitutions1(substitutions, #first name) 
	fun helper(names ,acc) =
	    case names of
		[] => name :: acc
	      | x :: xs =>  helper(xs, acc @ [{first = x, middle = #middle name, last = #last name}] );
    in helper(names, [])
    end;
		
 
	
(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove

(* put your solutions for problem 2 here *)
(*Problem A:*)
(*Card -> Color*)
(*Recieve a card and produce Red if it is hearts or Diamonds and black if is clubs or spades *)
	
fun card_color(suit, _) =
    case suit of
	Clubs => Black
     | Spades => Black
     | _ => Red;

(*Problem B:*)

fun card_value(_, rank) =
    case rank of
	Ace => 11
      | Num x => x
      | _ => 10;

(*Problem C:*)
(*(Listof Card) Card Exception => (Listof Card)*)
(*Recieve a LOC, a Card and a e. Produce a LOC without the given card in the list.*)

fun remove_card(cs, c, e) =
    let fun helper(cs: card list, acc: card list) =
	    case cs of
		[] => raise e
	      | x :: xs => if x = c
			   then acc @ xs
			   else helper (xs, x :: acc);
    in
	helper(cs, [])
    end;
(*Problem D: *)
(*Recieve a list of cards, Produce true if all are of the same color*)

fun all_same_color(cs) =
    case cs of
       []  => true
      | x :: [] => true
      | x1 :: x2 :: xs=> card_color(x1) = card_color(x2) andalso all_same_color(x2::xs);
		    
(*Problem E: *)
(*(Listof card) -> Integer*)

fun sum_cards(cards0) =
    let fun helper(cards, acc) =
	    case cards of
		[] => acc
	      | x::xs => helper(xs, (card_value x) + acc);
    in
	helper(cards0, 0)
    end;

							    
(*Problem F: *)
(*(ListOf card) Integer -> Integer*)
(*Recieve a list of cards and the goal and computes the score acording to the rules:*)
(*Sum is the total score of held cards.*)
(*- Preliminary score is: *)
(*- If sum > goal -> sum - goal * 3*)
(*- If sum < goal -> goal - sum *)
(*- If Held cards are same color. score is preliminary / 2, floored*)

fun score(hand, goal) =
    let val score = sum_cards(hand)
	val preliminary_score = if score <= goal
				then (goal - score)
				else (score - goal) * 3;
    in
	if all_same_color(hand)
	then preliminary_score div 2
	else preliminary_score
    end;

(*Problem G: *)
(*(listOf Card) (listOf String) Integer -> Integer*)
(*Recieve a LOC(List of cards), a LOM(List of moves), a goal and produce a final score*)

fun officiate(deck0, moves0, goal) =
    let  
	fun helper(deck, hand, moves) =
	    case moves of
		[] => score(hand, goal)
	      | x :: xs  => case x of
				Draw => (case deck of
					    [] => score (hand, goal)
					  | y :: ys => helper(ys, y :: hand, xs))
			      | Discard z => helper(deck, remove_card(hand, z, IllegalMove), xs);
    in
	helper(deck0, [], moves0)
    end;
	 
							     
							     
		
