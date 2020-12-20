
### Dockerized environment for join calculus 

Join calculus and JOCaml language based on it are very suitable for modelling of parallel and distributed processes. See the description/tutorial/installation instructions for the language at : http://jocaml.inria.fr/doc/index.html

 The JoCaml installation (from tarball) on Ubuntu 16.04.0 is implemented as Dockerfile. So, it is possible to run a docker container and test simple programms on JoCaml within docker container. 

 Build the image from the Dockerfile execution form the same folder: 
 ```
 sudo docker build -t jocaml .
 ```
 and then : 

 ```
 >/Dockerized-join-calculus$ sudo docker run -it --rm jocaml:latest
join@af7bce2a3856:~$ jocaml
        JoCaml version 4.01.0

# def echo(x) = print_int x; print_string "\n"; 0
  ;;
val echo : int Join.chan = <abstr>
# spawn echo(20) & echo(39)
  ;;
- : unit = ()
# 
39
20
  
join@af7bce2a3856:~$ vim fibonacci.ml
join@af7bce2a3856:~$ jocamlc fibonacci.ml
join@af7bce2a3856:~$ ls
a.out  fibonacci.cmi  fibonacci.cmo  fibonacci.ml
join@af7bce2a3856:~$ ./a.out
the fibonacchi output is : 
89
join@af7bce2a3856:~$ 
join@af7bce2a3856:~$ exit 
exit
~>/Dockerized-join-calculus$ ^C
~>/Dockerized-join-calculus$ 
```
Within the session we start interactive mode by 'jocaml' within container; 
defined echo channel; 
then copy pasted fibonacchi example from examples/fibonacci.ml using vim 
inside the container; 
then by 'jocamlc' compiled the fibonacci.ml file end finally executed it 
by ./a.out 


