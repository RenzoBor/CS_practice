(*(Exercise 1:)*)
(*Date is (Integer Integer Integer)*)
(*Interp. The first int is the year, the second the month and the third the day*)
fun is_older(d1 : (int * int * int), d2: (int * int * int)) =
    if #1 d1 = #1 d2 andalso #2 d1 = #2 d2 andalso #3d1 < #3 d2
    then true
    else if #1 d1= #1 d2 andalso #2 d1 > #2 d2
    then true
    else #1 d1 < #1 d2


(*(Exercise 2:)*)
(*- (ListOf Date) Natural -> Natural*)
(*- Recieve a List of dates and a month and produce how many dates in the list are in the given month*)

fun number_in_month(ls : (int * int * int) list, m : int) =
	 if null ls
	 then 0
	 else if  #2 (hd ls) = m
	 then 1 + number_in_month(tl ls, m)
	 else number_in_month(tl ls, m);

(*(Exercise 3:)*)		       
(*(ListOf Dates) (listOf Natural) -> Natural *)
(*Recieve a list of Dates and a list of months (Natural) and produce the number of dates that has the month of any of the list of months*)

fun number_in_months(dls: (int*int*int) list, mls: int list) =
    if null mls
    then 0
    else number_in_month(dls, (hd mls)) + number_in_months(dls, (tl mls));


(*(Exercise 4:)*)
(*(listOf date) Natural -> (listOf Date)*)
(*Recieve a list of dates and a month. And produce a list of all the dates that have that month*)

fun dates_in_month(ls : (int*int*int) list, m : int) =
    if null ls
    then []
    else if #2 (hd ls) = m
    then hd ls :: dates_in_month(tl ls, m)
    else dates_in_month(tl ls, m);

(*(Exercise 5:)*)
(*(listOf date) (listOf Natural) -> (listOf Date)*)
(*Recieve a list of dates and a list of months and produce a list of all the dates that have any month in the given list*)

fun dates_in_months(dateLs: (int*int*int)list, monthLs : int list) =
    if null monthLs
    then []
    else dates_in_month(dateLs, hd monthLs) @ dates_in_months(dateLs, tl monthLs);

(*(Exercise 6:)*)
(*(listOf String) Natural -> String*)
(* Recieve a list of strings and a natural(n) and produces the nth element in the list*)
fun get_nth(los : string list , n : int) =
    if n = 1
    then hd los
    else get_nth(tl los, n - 1);
					    
(*(Exercise 7:)*)
(*Date -> string*)
(*Recieve a Date and produce a string in the form: January 20, 2013*)
val months = [ "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
fun date_to_string(d : (int*int*int)) =
    get_nth(months, #2 d) ^ " " ^ Int.toString(#3 d) ^ ", " ^ Int.toString(#1 d);

(*(Exercise 8:)*)
(*Natural (listOf Natural) -> Natural*)
(*recieve a Natural and a list of Natural. Produce the number of elements that sums up to the given natural but the sum isn't greater*)
fun number_before_reaching_sum(sum : int, ls0: int list) =
    let
	fun inner_function(ls: int list,  count : int, total : int) =
	    (*I implemented an accumulator bc the program needs to keep track of the previous states somehow*)
	    if sum <= total
	    then count - 1
	    else inner_function(tl ls, count + 1, total + hd ls)
    in
	inner_function(ls0, 0, 0)
    end;
    
(*(Exercise 9:)*)
(*Natural -> Natural*)
(*Recieve a day in a year(Natural[1, 365]) and produce what month(Natural[1, 12]) that day should be*)
val days_per_month = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
val days_per_month_leap_year = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

fun what_month(day : int) =
    number_before_reaching_sum(day, days_per_month) + 1


(*(Exercise 10:)*)
(*Natural Natural -> (listOf Natural)*)
(*Recieve 2 days of the year (Natural[1,365] and produce a list of all day's month between d1 and d2)*)
fun month_range(d1 : int, d2 : int) =
    if d1 > d2
    then []
    else number_before_reaching_sum(d1, days_per_month) + 1 :: month_range(d1+1, d2);

(*(Exercise 11:)*)
(*(listOf Date) -> Option(Date)*)
(*Recieve a Lod and produces an option of the oldest date in the list. NONE if it is empty*)


fun oldest(ls0:(int*int*int) list) =
    let
	fun get_oldest(ls: (int*int*int) list) =
	    if null (tl ls)
	    then hd ls
	    else if is_older(hd ls, hd (tl ls))
	    then get_oldest(hd ls::tl(tl ls))
	    else get_oldest(tl ls);
    in
	if null ls0
	then NONE
	else SOME (get_oldest(ls0))
    end;


(*(Exercise 12: CHALLENGE PROBLEM)*)
(*(listOf Date) (listOf Natural) -> Natural*)
(*Just like problem 3 but having repeated months in monthList doesn't make effect*)

fun remove_duplicates(ls: int list)=
    
    let fun is_duplicated(num : int, ls: int list) =
	    if null ls
	    then false
	    else if num = hd ls
	    then true
	    else is_duplicated(num, tl ls)
		
	in
	    if null (tl ls)
	    then hd ls :: []
	    else if is_duplicated(hd ls, tl ls)
	    then remove_duplicates(tl ls)
	    else hd ls :: remove_duplicates(tl ls)
    end;

fun number_in_months_challenge(dateLs: (int*int*int) list, monthLs: int list) =
    number_in_months(dateLs, remove_duplicates(monthLs));

(*(listOf Date) (listOf Natural) -> Natural*)
(*Just like problem 5 but having repeated months in monthList doesn't make effect*)

fun dates_in_months_challenge(dateLs: (int * int * int) list, monthLs: int list) =
    dates_in_months(dateLs, remove_duplicates(monthLs));


													  
(*(Exercise 13: CHALLENGE PROBLEM)*)
(*Date -> Boolean*)
(*Recieve a Date and determines if it is a reasonable date, this means that the month is between 1 and 12, the year is positive, and if it is a leap year, the 2nd month has 29 days*)

fun reasonable_date(date : (int * int * int)) =
    let
	fun is_leap_year(year : int) =
	    (year mod 400 = 0)  orelse (year mod 4 = 0 andalso year mod 100 <> 0)
	fun valid_month(day : int, month : int , monthLs: int list) =
	    if month = 1
	    then day <= hd monthLs
	    else valid_month(day, month - 1, tl monthLs);
    in
	if
	    #2 date > 0 andalso #2 date < 12 andalso #1 date > 0
	then if is_leap_year(#1 date)
	     then valid_month((#3 date), (#2 date), days_per_month_leap_year) (*I reused the list from earlier problems*)
	     else valid_month((#3 date), (#2 date), days_per_month)
	else false
    end;
					   
