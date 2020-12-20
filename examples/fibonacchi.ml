(* fibonacchi example*)

def fib(n) =
   if n <= 1 then reply 1 to fib
   else reply fib(n-1) + fib(n-2) to fib
;;
print_string "the fibonacchi output is : \n";;
print_int (fib 10);;
print_string "\n";;