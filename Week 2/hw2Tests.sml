use "hw2.sml";

val p1 = all_except_option("cat", ["rat", "dog", "cat", "moose"]) = SOME ["rat", "dog", "moose"]
val p2 = all_except_option("cat", ["rat"]) = NONE
val p3 = all_except_option("cat", ["cat"]) = SOME []
val p4 = all_except_option("cat", []) = NONE

val p5 = get_substitutions1([["Fred", "Fredrick"], ["Elizabeth", "Betty"], ["Freddie", "Fred", "F"]], "Fred") = ["Fredrick","Freddie","F"]
val p6 = get_substitutions1([["Fred", "Fredrick"], ["Jeff", "Jeffrey"], ["Geoff", "Jeff", "Jeffrey"]],"Jeff") = ["Jeffrey","Geoff","Jeffrey"]
val p7 = get_substitutions1([], "Dan") = nil

val p8 = get_substitutions2([], "Jeff") = nil
val p9 = get_substitutions2([["Fred", "Fredrick"], ["Jeff", "Jeffrey"], ["Geoff", "Jeff", "Jeffrey"]],"Jeff") = ["Jeffrey","Geoff","Jeffrey"]
val p10 = get_substitutions2([["Fred", "Fredrick"], [], ["Geoff", "Jeff", "Jeffrey"]],"Jeff") = ["Geoff","Jeffrey"]

val p11 = similar_names([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]],{first="Fred", middle="W", last="Smith"}) = [{first="Fred",last="Smith",middle="W"}, {first="Fredrick",last="Smith",middle="W"},{first="Freddie",last="Smith",middle="W"}, {first="F",last="Smith",middle="W"}]
val p12 = similar_names([], {first="Daniele",last="Pestilli",middle="Massimo"}) = [{first="Daniele",last="Pestilli",middle="Massimo"}]

val p13 = card_color(Clubs, Jack) = Black
val p14 = card_value(Diamonds, Queen) = 10
val p15 = card_value(Clubs,Ace) = 11
val p16 = card_value(Spades, Num(4)) = 4
val p17 = card_value(Hearts,King) = 10


val p30 = all_same_color( [(Diamonds, King), (Hearts, Queen)] ) = true
val p31 = all_same_color( [] ) = true
val p32 = all_same_color( [(Spades, Num(1)), (Diamonds, Jack)] ) = false
val p33 = all_same_color( [(Diamonds, Jack), (Hearts, Ace), (Clubs, Num(9))] ) = false
val p33a = all_same_color( [(Diamonds, King), (Diamonds, Queen), (Diamonds, Ace), (Hearts, Num(10))] ) = true

val p34 = sum_cards( [(Diamonds,Num(10)), (Spades, Num(10))] ) = 20
val p35 = sum_cards( [] ) = 0
val p36 = sum_cards( [(Hearts, Ace), (Diamonds,Jack), (Clubs, Num(2))] ) = 23
val p37 = sum_cards( [(Clubs, Num(1)), (Spades,Queen), (Clubs, Num(6))] ) = 17

val p38 = score( [(Clubs, Num(10)), (Spades, King), (Diamonds, Num(8))], 20) = 24
val p39 = score( [(Diamonds, Num(1))], 20) = 9
val p40 = score( [(Diamonds, Num(1)), (Clubs, Num(2))], 20) = 17
(* Dan Grossman, Coursera PL, HW2 Provided Tests *)

(* These are just two tests for problem 2; you will want more.

   Naturally these tests and your tests will use bindings defined 
   in your solution, in particular the officiate function, 
   so they will not type-check if officiate is not defined.
 *)


fun provided_test1 () = (* correct behavior: raise IllegalMove *)
    let val cards = [(Clubs,Jack),(Spades,Num(8))]
	val moves = [Draw,Discard(Hearts,Jack)]
    in
	officiate(cards,moves,42)
    end

fun provided_test2 () = (* correct behavior: return 3 *)
    let val cards = [(Clubs,Ace),(Spades,Ace),(Clubs,Ace),(Spades,Ace)]
	val moves = [Draw,Draw,Draw,Draw,Draw]
    in
 	officiate(cards,moves,42)
    end
