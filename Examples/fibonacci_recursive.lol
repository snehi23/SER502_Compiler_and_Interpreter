print "Fibonacci_series":
print "1_1_2_3_5_8_13_21":
scan a :
func fibo << val >> fstart :
if ( val < 2 ) [ :
return val :
] :
else [ :
x =  val - 1 :
y =  val - 2 :
m = call fibo << x >> : 
n = call fibo << y >> :
p = m + n :
return p :
] :
fend :
c = call fibo << a >> :
print c :