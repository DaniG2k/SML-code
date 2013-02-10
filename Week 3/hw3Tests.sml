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

val p16 = match( Const 1, Variable "foo" ) = SOME [("foo",Const 1)];
val p17 = match( Tuple[ Unit, Unit, Const 2 ], TupleP[ Variable "a", UnitP, ConstP 2 ] );
(***************************)
val test_p1 = Wildcard
val test_p2 = Variable "abc"
val test_p3 = ConstP 42
val test_p4 = ConstructorP( "test", Wildcard )
val test_p5 = TupleP [test_p1,test_p2,test_p3,test_p4]
val test_p6 = TupleP [test_p1,test_p5,test_p4]

val test_v1 = Const 13
val test_v2 = Const 42
val test_v3 = Unit
val test_v4 = Constructor( "test", Const 1 )
val test_v5 = Constructor( "abcd", Const 1 )
val test_v6 = Tuple [test_v1,test_v2,test_v2,test_v4]
val test_v7 = Tuple [test_v3,test_v6,test_v4]
val test_v8 = Tuple [test_v1,test_v2,test_v3,test_v4]

val match_none = match( test_v1, test_p3 ) = NONE andalso
                 match( test_v2, test_p4 ) = NONE andalso
                 match( test_v3, test_p5 ) = NONE andalso
                 match( test_v5, test_p4 ) = NONE andalso
                 match( test_v8, test_p5 ) = NONE andalso
                 match( test_v8, test_p6 ) = NONE andalso
                 match( test_v8, test_p5 ) = NONE

val match_empty = match( test_v1, test_p1 ) = SOME [] andalso
                  match( test_v2, test_p3 ) = SOME [] andalso
                  match( test_v3, UnitP ) = SOME [] andalso
                  match( test_v4, test_p4 ) = SOME []

val match_bindings = match( test_v1, test_p2 ) = SOME [("abc",test_v1)] andalso
                     match( test_v4, ConstructorP( "test", test_p2 ) ) =
                     SOME [("abc",Const 1)] andalso
                     match( test_v6, test_p5 ) = SOME [("abc",Const 42)]


val cons1  = Constructor("answer", Const(42));
val consp1 = ConstructorP("answer", Variable("the_answer"));
val cons2  = Constructor("marvin", Unit);
val consp2 = ConstructorP("marvin", Variable("depressing_robot"));
val vals_tuple = Tuple[Const(42), Constructor("How many roads must a man walk down?", Const(42)),
                       Unit, Tuple[Const(44), Unit], cons1, cons2];
val pats_tuple = TupleP[Wildcard, Variable("question"),
                        UnitP, TupleP[Wildcard, UnitP], consp1, consp2];
first_match cons1 [consp2,pats_tuple]
= NONE;
first_match cons1 [consp2,pats_tuple,consp1]
= SOME [("the_answer",Const 42)];
first_match cons1 [consp2,pats_tuple,Variable("an_answer")]
= SOME [("an_answer",Constructor ("answer",Const 42))];

