fun same_string (s1 : string, s2 : string) =
    s1 = s2

(*1a*)
fun all_except_option (s, []) = NONE
  | all_except_option (s, x::xs) =
    if same_string(s, x)
    then SOME xs
    else
	case all_except_option(s, xs) of
	    NONE => NONE
	  | SOME xs' => SOME (x::xs')

(*1b*)
fun get_substitutions1 (subs, s)=
    case subs of
	nil => []
      | x::xs => case all_except_option(s, x) of
		     NONE => get_substitutions1(xs, s)
		   | SOME lst => lst @ get_substitutions1(xs, s)

(*1c*)
fun get_substitutions2 (subs, s)=
    let
	fun aux (subs, s, acc)=
	    case subs of
		nil => acc
	      | x::xs => case all_except_option(s, x) of
			     NONE => aux(xs, s, acc)
			   | SOME lst => aux(xs, s, acc @ lst)
    in
	aux(subs, s, [])
    end

(*1d*)
fun similar_names (subs, fullname)=
    let
	val {first=f, middle=m, last=l} = fullname;
	val names = get_substitutions2(subs, f);
	fun make_dict (names, m, l)=
	    case names of
		nil => []
	      | x::[] => [{first=x, middle=m, last=l}]
	      | x::xs => [{first=x, middle=m, last=l}] @ make_dict(xs, m, l)
    in
	[fullname] @ make_dict(names, m, l)
    end
	

datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove

(*2a*)
fun card_color (card)=
    case card of
	(Diamonds,_) => Red
      | (Hearts,_) => Red
      | (Spades,_) => Black
      | (Clubs,_) => Black

(*2b*)
fun card_value (_, rank)=
    case rank of
	Ace => 11
      | Num i => i
      | _ => 10

(*2c*)
fun remove_card (cs, c: card, e)=
    case cs of
	x::xs => if c = x then xs
		 else x :: remove_card(xs, c, e)
      | _ => raise e

(*2d*)
fun all_same_color (cs)=
    case cs of
	x::y::xs => (card_color x = card_color y) andalso all_same_color(y::xs)
      | _ => true

(*2e*)
fun sum_cards (cs)=
    let
	fun aux (cs, acc)=
	    case cs of
		nil => acc
	      | x::[] => acc + card_value(x)
	      | x::xs => aux(xs, acc + card_value(x))
    in
	aux(cs, 0)
    end

(*2f*)
fun score (cs, goal)=
    let
	val sum = sum_cards(cs)
	val preliminary_score = if sum > goal
				then 3 * (sum - goal)
				else goal - sum
    in
	if all_same_color(cs)
	then preliminary_score div 2
	else preliminary_score
    end

(*2g*)
fun officiate (cards, moves, goal)=
    let	fun play (cards, moves, held, score)=
	    case moves of
		nil => held
	      | Discard c::mvs => play(cards, mvs, remove_card(held, c, IllegalMove), score - card_value c)
	      | Draw::mvs => case cards of
			    nil => held
			    | x::xs => let val t = score + card_value x
					   val m = if t > goal then [] else mvs
				       in
					   play(xs, m, x :: held, t)
				       end
    in
	score(play(cards, moves, [], 0), goal)
    end
