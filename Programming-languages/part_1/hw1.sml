(*Date is (Integer Integer Integer)*)
(*Interp. The first int is the year, the second the month and the third the day*)
fun is_older(d1 : (int * int * int), d2: (int * int * int)) =
    if #1 d1 = #1 d2 andalso #2 d1 = #2 d2 andalso #3d1 < #3 d2
    then true
    else if #1 d1= #1 d2 andalso #2 d1 > #2 d2
    then true
    else if #1 d1 < #1 d2
    then true
    else false
val x = is_older((1,2,3), (1,2,2)); (*false*)
val y = is_older((1,2,3), (1,2,4)); (*true*)
val z = is_older((3,2,1), (1,2,3)); (*false*)
val w = is_older((1,2,3), (3,2,1)); (*true*)
(*- (ListOf Date) Natural -> Natural*)
(*- Recieve a List of dates and a month and produce how many dates in the list are in the given month*)

fun number_in_month(ls : (int * int * int) list, m : int) =
	 if null ls
	 then 0
	 else if  hd #2 ls = m
	 then 1 + number_in_month(tl ls, m)
	 else number_in_month(tl ls, m);
			
	    
val q = number_in_month([(1, 2, 3), (4 ,1 ,6), (3, 2, 5)], 2) (*2*)
val e = number_in_month([(1, 2, 3), (4 ,1 ,6), (3, 2, 5)], 1) (*1*)
val r = number_in_month([(1, 2, 3), (4 ,1 ,6), (3, 2, 5)], 0) (*0*)
		       
