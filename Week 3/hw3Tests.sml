use "hw3.sml";

val p1 = only_capitals(["Daniele", "federico"]) = ["Daniele"]
val p2 = only_capitals([]) = []

val p3 = longest_string1([]) = ""
val p4 = longest_string1(["yo momma"]) = "yo momma"
val p5 = longest_string1(["Daniele", "Federico"]) = "Federico"
val p6 = longest_string1(["cat", "dog"]) = "cat"

val p7 = longest_string2(["cat", "dog"]) = "dog"
val p8 = longest_string2(["cat", "fat", "rat"]) = "rat"

val p9 = longest_string3(["aa", "bb"]) = "aa"
val p10 = longest_string3([]) = ""
val p11 = longest_string4(["aa", "bb"]) = "bb"

val p12 = longest_capitalized(["daniele", "Daniele"]) = "Daniele"

val p13 = rev_string "Daniele" = "eleinaD"
val p14 = rev_string "dad" = "dad"

(*
val first_answer_t1 = first_answer is_even [1,2,3,4,5,6] = [2]
val first_answer_test2= (first_answer is_even [1, 3, 5] handle NoAnswer => [0]) = [0];
val first_answer_test3 = first_answer is_even [1, 3, 5, 6] = [6];
val first_answer_test4 = (first_answer is_even [] handle NoAnswer => [0]) = [0];


val all_answers_test1 = all_answers is_even [1, 2, 3, 4, 5, 6] = NONE;
val all_answers_test2 = all_answers is_even [2, 4, 6] = SOME [2, 4, 6];
val all_answers_test3 = all_answers is_even [] = SOME [];
*)
val a = TupleP [Wildcard, Wildcard, UnitP, Wildcard, Variable "qwerty", Wildcard];
val p15 = count_wildcards a = 4;

val pat1 = TupleP([ConstP 12, Variable "var1", ConstructorP("constr1", Wildcard)]);
val pat2 = TupleP([Variable "var", Wildcard, TupleP([Variable "var", Wildcard, TupleP([Variable "var", Wildcard])])]);
val pat3 = TupleP([Variable "var1", Wildcard, TupleP([Variable "var2", Wildcard, TupleP([Variable "var3", Wildcard])])]);
val a09b1 = count_wild_and_variable_lengths pat1 = 5;
val a09b2 = count_wild_and_variable_lengths UnitP = 0;
val a09b3 = count_wild_and_variable_lengths pat2 = 12;

val a09c1 = count_some_var("var1", pat1) = 1;
val a09c2 = count_some_var("whatever", UnitP) = 0;
val a09c3 = count_some_var("var", pat2) = 3;


val a1001 = check_pat UnitP;
val a1002 = check_pat pat1;
val a1003 = check_pat pat3;
