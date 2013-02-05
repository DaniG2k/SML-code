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
