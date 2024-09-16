fun increment_n_times(n, x) =
    if n = 0
    then x
    else 1 + increment_n_times(n-1, x);
val x1 = increment_n_times(5, 3);

fun increment x = 1 + x;

fun fn_n_times(f, n, x) =
    if n = 0
    then x
    else f(fn_n_times(f, n-1, x));

val x2 = fn_n_times(increment, 5, 3);
			      
val multiplicalo = fn a => fn b => fn c => a * b * c; (*curryng*)

val x3 = multiplicalo 2 3 4
