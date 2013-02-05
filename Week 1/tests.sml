use "hw1.sml";

(* Test cases for #1 *)
val t1 = is_older((0,0,0),(1,2,3)) = true
val t2 = is_older((1987,6,2), (1985,4,18)) = false
val t3 = is_older((~1,2,3),(1,2,3)) = true
val t4 = is_older((1800,12,31), (1700,12,31)) = false

(* Test cases for #2 *)
val t5 = number_in_month( [(1,2,3)], 1 ) = 0
val t6 = number_in_month( [(1987,6,2), (1985,4,18), (1856,6,12)], 6 ) = 2
val t7 = number_in_month( [(223,213,45), (~23,~32,32), (34,5,123)], ~32 ) = 1

(* Test cases for #3 *)
val t8 = number_in_months( [(1,2,3)], [1,2,3]) = 1
val t9 = number_in_months( [(1987,6,2), (1985,4,18)], [123,435,67,768,345,665,6,4] ) = 2
val t10 = number_in_months( [(0,0,0),(0,0,0)], [1] ) = 0

(* Test cases for #4 *)
val t11 = dates_in_month( [(0,0,0)], 1 ) = nil
val t12 = dates_in_month( [(1987,6,2), (1985,4,18), (1954,3,23)], 6 ) = [(1987,6,2)]
val t13 = dates_in_month( [(~1,~2,~3), (0,0,0)], ~6 ) = nil
val t14 = dates_in_month( [(~1,~2,~3), (0,0,0), (1,2,3)], ~2 ) = [(~1,~2,~3)]

(* Test cases for #5 *)
val t15 = dates_in_months( [(0,0,0)], [1] ) = nil
val t16 = dates_in_months( [(1987,6,2), (1985,4,18), (1954,3,23)], [6,4] ) = [(1987,6,2), (1985,4,18)]
val t17 = dates_in_months( [(~1,~2,~3), (0,0,0)], [~6] ) = nil
val t18 = dates_in_months( [(~1,~2,~3), (0,0,0), (1,2,3)], [~2] ) = [(~1,~2,~3)]
val t19 = dates_in_months( [(~1,~2,~3), (0,0,0), (1,2,3)], [~2,2] ) = [(~1,~2,~3),(1,2,3)]

(* Test cases for #6 *)
val t20 = get_nth(["a","b","c"], 2) = "b"

(* Test cases for #7 *)
val t21 = date_to_string((1987,6,2)) = "June 2, 1987"
val t22 = date_to_string((1950,4,20)) = "April 20, 1950"
val t23 = date_to_string((0,1,0)) = "January 0, 0"

(* Test cases for #8 *)
val t24 = number_before_reaching_sum(200,[10,10,10,10,40,12,234]) = 6
val t25 = number_before_reaching_sum(0,[1,2,3,4]) = 0
(* check this one *)
val t26 = number_before_reaching_sum(1,[0,0,0,1,2,3,4])

(* Test cases for #9 *)
val t27 = what_month(34) = 2
val t28 = what_month(0) = 1
val t29 = what_month(365)
val t30 = what_month(150)
val t31 = what_month(370)

(* Test cases for #10 *)
val t32 = month_range(30,45)
val t33 = month_range(1,1) = [1]
val t34 = month_range(36,365)

(* Test cases for #11 *)

val t35 = oldest([(0,0,0)]) = SOME (0,0,0)
val t36 = oldest( [(1,2,3),(4,5,6),(7,8,9)]) = SOME (1,2,3)
val t37 = oldest( [(1,2,3),(4,5,6),(7,8,9), (~1,2,3)]) = SOME (~1,2,3)
val t38 = oldest( [(1987,6,2), (1985,4,18)] ) = SOME (1985,4,18)

(* Test cases for #12 *)
val t39 = number_in_months_challenge ([(1,2,3),(1987,6,2),(1985,4,18),(3,63,34)], [1,2,1,2,1,2,1,56,23,765,234,6,7,8,910]) = 2
val t40 = number_in_months_challenge ([(1,2,3),(1,2,3),(1,2,3)],[1,2,3,1,2,3,1,2,3]) = 3
val t41 = number_in_months_challenge ([(1,2,3)],[2,2,2,2,2,2]) = 1
val t42 = dates_in_months_challenge([(1,2,3),(1987,6,2),(1985,4,18),(3,4,5)], [1,2,1,3,5,2,2,5,4,4,4,444]) = [(1,2,3),(1985,4,18),(3,4,5)]

(* Test cases for #13 *)
val t43 = reasonable_date(0,0,0) = false
val t44 = reasonable_date(1987,6,2) = true
val t45 = reasonable_date(~1,2,3) = false
val t46 = reasonable_date(2012,1,17) = true
val t47 = reasonable_date(1985,4,18) = true
val t48 = reasonable_date(23113,11312,12312) = false
(* check for leap years *)
val t49 = reasonable_date(142840,2,29) = true
val t50 = reasonable_date(400,2,29) = true
val t51 = reasonable_date(100,2,29) = false
val t52 = reasonable_date(1987,6,32) = false
