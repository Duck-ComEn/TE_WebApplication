
puts "Sourcing lab 2"

#----------------------------------------
# Test Script - This one should work
#----------------------------------------

proc test1 {} {
  puts "lab 2 was sourced successfully"
}

#----------------------------------------
# Exercise 1 - Fix the problem
#----------------------------------------

proc ex1 {n} {
    if {n>0} {
	puts "positive"
    } else {
	puts "negative"
    }
}

#----------------------------------------
# Exercise 2 - Fix the problem
#----------------------------------------

proc ex2 {a b} {
    if {$a+$b} {
	puts "a+b is not zero"
    } 
    else {
	puts "a+b is zero"
    }
}

#----------------------------------------
# Exercise 3 - Fix the problem
#----------------------------------------

proc ex3 {rows} {
    for {set i 0} {$i < 10} {incr $i} {
	for {set y 0} {$y < $rows} {incr $y} {
	    for {set x 0} {$x <= $y} {incr $x} {
		puts -nonewline " "
	    }
	    puts "\\"
	}
    }
}

#---------------------------------------------
# Exercise 4 - Rewrite ex #3 using while loops
#     Here's a start:
#---------------------------------------------

proc ex4 {rows} {
    set i 0
    while {$i < 10} {
	for {set y 0} {$y < $rows} {incr $y} {
	    for {set x 0} {$x <= $y} {incr $x} {
		puts -nonewline " "
	    }
	    puts "\\"
	}
	incr i
    }
}

#---------------------------------------------
# Exercise 5 - Rewrite ex #3 but make the
#   zigzags go both ways (hint: incr y -1)
#---------------------------------------------

proc ex5 {rows} {
}






