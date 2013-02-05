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
	     | Datatype of string

(*1*)
fun only_capitals (lst)=
    List.filter(fn s => Char.isUpper(String.sub(s, 0))) lst

(*2*)
fun longest_string1 (lst)=
    List.foldl(fn (x, y) =>
		  if String.size x > String.size y then x else y) "" lst

(*3*)
fun longest_string2 (lst)=
    List.foldl(fn (x, y) =>
		  if String.size x >= String.size y then x else y) "" lst
(*4*)
fun longest_string_helper f=
    List.foldl (fn (x, y) =>
		   if f (String.size x, String.size y)
		   then x
		   else y) ""

val longest_string3 = longest_string_helper(op >)
val longest_string4 = longest_string_helper(op >=)

(*5*)
val longest_capitalized = longest_string1 o only_capitals

(*6*)
fun rev_string s = (String.implode o rev o String.explode) s

(*7*)
(*
fun first_answer
*)