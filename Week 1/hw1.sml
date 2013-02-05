(*1*)
fun is_older (d1 : (int * int * int), d2 : (int * int * int))=
    if d1 = d2
    then false
    else if #1 d1 < #1 d2
    then true
    else if #1 d1 = #1 d2 andalso #2 d1 < #2 d2
    then true
    else if #1 d1 = #1 d2 andalso #2 d1 = #2 d2 andalso #3 d1 < #3 d2
    then true
    else false

(*2*)
fun number_in_month (dates: (int * int * int) list, month: int) =
    if dates = nil
    then 0
    else if #2 (hd dates) = month
    then 1 + number_in_month(tl dates, month)
    else number_in_month(tl dates, month)

(*3*)
fun number_in_months (dates: (int * int * int) list, months: int list) =
    if months = nil
    then 0
    else number_in_month(dates, hd months) + number_in_months(dates, tl months)

(*4*)
fun dates_in_month (dates: (int * int * int) list, month: int) =
    if dates = nil
    then []
    else if #2 (hd dates) = month
    then [hd dates]@dates_in_month(tl dates, month)
    else dates_in_month(tl dates, month)

(*5*)
fun dates_in_months (dates: (int * int * int) list, months: int list) =
    if months = nil
    then []
    else dates_in_month(dates, hd months) @ dates_in_months(dates, tl months)

(*6*)
fun get_nth (s: string list, n: int)=
    if n = 1
    then hd s
    else let
	val one_less = n - 1
    in
	get_nth(tl s, one_less)
    end

(*7*)
fun date_to_string (date: int * int * int) =
    let
	val m = get_nth(["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"], #2 date)
	val d = Int.toString(#3 date)
	val y = Int.toString(#1 date)
    in
	m^" "^d^", "^y
    end

(*8*)
fun number_before_reaching_sum (sum: int, nums: int list)=
    if hd nums >= sum
    then 0
    else
	let
	    val new_sum = sum - (hd nums)
	in
	    1 + number_before_reaching_sum(new_sum, tl nums)
	end
(*9*)
fun what_month (day: int)=
(* Handle the case where the user inputs a number greater than 365.
In this case, we reset the calendar day and recurse our function *)
    if day > 365
    then
	what_month(day - 365)
    else
	let
	    val days_in_month = [31,28,31,30,31,30,31,31,30,31,30,31]
	in
	    1 + number_before_reaching_sum(day, days_in_month)
	end

(*10*)
fun month_range (day1: int, day2: int)=
    if day1 > day2
    then []
    else
	let
	    fun build_array (start: int, stop: int)=
		if start = stop
		then [stop]
		else
		    [start] @ build_array (start + 1, stop)
					  
	    fun day_range_to_month_list (l: int list)=
		if l = nil
		then []
		else
		    [what_month(hd l)] @ day_range_to_month_list(tl l)
	in
	    day_range_to_month_list( build_array(day1, day2) )
	end

(*11*)
fun oldest (dates: (int * int * int) list)=
    if dates = nil
    then NONE
    else
	let
	    val first = hd dates
	    val second = tl dates
	    fun compare (f: (int*int*int), s: (int*int*int) list)=
		if s = nil
		then SOME(f)
		else if is_older (f, hd s)
		then
		    compare (f, tl s)
		else
		    compare (hd s, tl s)
	in
	    compare (first, second)
	end

(*12*)
(* HELPER FUNCTIONS *)
fun check_duplicate_int (i: int, l: int list)=
    if l = nil
    then [i]
    else
	let
	    val newlist = []
	    val next = hd l
	in
	    if i = next
	    then
		check_duplicate_int(i, tl l)
	    else
		check_duplicate_int(i, tl l) @ newlist @ [next]
	end
	    
fun check_duplicates_in_list (l: int list)=
    if l = nil
    then []
    else
	let
	    val current = hd l
	    val newlist = check_duplicate_int(current, l)
	in
	    [current] @ check_duplicates_in_list(tl newlist)
	end
(* END HELPER FUNCS *)

fun number_in_months_challenge (dates: (int*int*int) list, months: int list)=
    let
	val clean_months = check_duplicates_in_list(months)
    in
	number_in_months(dates, clean_months)
    end

fun dates_in_months_challenge (dates: (int * int * int) list, months: int list) =
    let
	val clean_months = check_duplicates_in_list(months)
    in
	dates_in_months(dates, clean_months)
    end

(*13*)
fun reasonable_date (date: (int*int*int) )=
    let
	val year = #1 date
	val month = #2 date
	val day = #3 date

	fun is_leap_year (yr: int)=
	    if yr mod 400 = 0
	    then true
	    else if yr mod 100 = 0
	    then false
	    else if yr mod 4 = 0
	    then true
	    else false

	fun check_days_in_month (counter: int, year: int, month: int, days: int list)=
	    if counter = month
	    then
		if is_leap_year(year) andalso month = 2
		then
		    29
		else hd days
	    else
		let
		    val counter = counter + 1
		    val days = tl days
		in
		    check_days_in_month(counter, year, month, days)
		end

	val counter = 1
	val days_in_month = [31,28,31,30,31,30,31,31,30,31,30,31]
    in
	if year < 1
	then false
	else if month < 1 orelse month > 12
	then false
	else if day < 1 orelse day > check_days_in_month(counter, year, month, days_in_month)
	then false
	else
	    true
    end
