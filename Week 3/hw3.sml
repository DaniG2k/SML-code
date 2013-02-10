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
fun first_answer f lst =
    case lst of
	x::xs => (case f x of
		     SOME v => v
		   | NONE => first_answer f xs)
      | _ => raise NoAnswer
					  
(* Helper function to test first_answer *)
(*fun is_even x = if x mod 2 = 0 then SOME([x]) else NONE*)

(*8*)
fun all_answers alpha lst=
    let	fun helper (alpha, lst, acc)=
	    case lst of
		nil => SOME acc
	      | x::xs => (case alpha x of
			     NONE => NONE
			   | SOME e => helper(alpha, xs, acc @ e))
    in
	helper(alpha, lst, [])
    end

(*9a*)
fun count_wildcards p=
    g (fn _ => 1) (fn _ => 0) p

(*9b*)
fun count_wild_and_variable_lengths p=
    g (fn _ => 1) (fn x => String.size x) p

(*9c*)
fun count_some_var (s, p)=
    g (fn _ => 0) (fn x => if x = s then 1 else 0) p
      
(*10*)
fun check_pat p=
    let fun aux (p, acc)=
	    case p of
		TupleP ps => List.foldl (fn (x,y) => aux(x,y)) acc ps
	      | ConstructorP(s,ps) => aux(ps, s::acc)
	      | Variable s => s::acc
	      | _ => acc
	fun no_duplicates [] = true
	  | no_duplicates (x::xs) =
	    if List.exists (fn y => x = y) xs then false
	    else no_duplicates xs
    in
	no_duplicates(aux(p, []))
    end
				    
(*11*)
fun match (v, p)=
    case (v, p) of
	(_,Wildcard) => SOME []
      | (Unit, UnitP) => SOME []
      | (v, Variable x) => SOME [(x,v)]
      | (Const x, ConstP y) => if x = y then SOME [] else NONE
      | (Tuple vs, TupleP ps) => all_answers match (ListPair.zip(vs, ps))
      | (Constructor(s1, v'), ConstructorP(s2, p')) =>
	if s1 = s2 then match(v',p') else NONE
      | _ => NONE

(*12*)
fun first_match v pl=
    SOME (first_answer (fn x => match(v,x)) pl)
    handle NoAnswer => NONE
