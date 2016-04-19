# SER502_Compiler_and_Interpreter
Language Design Project using flex and bison for compiler and python for interpreter [Run time environment]

Steps to generate G28.g28 executable

flex G28.l
bison -d G28.y
gcc -o G28.g28 lex.yy.c G28.tab.c -ll -lm

Steps to compile .g28 code

./G28.g28 <file-name>.g28

Steps to interpret and run code

javac G28Run.java
java G28Run <file-name>.g28.int
