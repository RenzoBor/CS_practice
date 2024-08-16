/*The execution of the p() function would create an infinite loop of returns, that will cause a colapse of the aplication.
  In applicative-order evaluation the test() function would never get to enter to the body of it. Because colapses in the
  evaluation of the arguments. Otherwise in normal order evaluation the function gets to enter in the body of the function
  and colapses only if the user enters a number diferent to zero. In the end if the lenguaje uses applicative-order and the user
  says that the first argument is zero it will colapse anyways. In normal-order it will return 0 */ 
  function test(x,y){
    return x===0?0:y;
 }
 test(0,p())
 //In this case test cause an error. So Javascript uses applicative-order evaluation.