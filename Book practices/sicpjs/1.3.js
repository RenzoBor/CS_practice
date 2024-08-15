//Declare a function that takes three numbers as arguments and returns the sum of the squares of the two larger numbers

function sumOf2Squares(a,b,c){
    let n1=a >= b || a >= c ? a : b;
    let n2=c >= a || c >= b ? c : b;
    return((n1 * n1) + (n2 * n2)) 
}

console.log(sumOf2Squares(2,4,3));


