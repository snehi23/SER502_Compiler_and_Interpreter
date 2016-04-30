scan a :
b = 1 :   
func abc <<b>> fstart :
b = b + 10 :
print "local_value_of_b_is":
print b :
fend :
call abc <<a>> :
print "global_value_of_b_is":
print b : 