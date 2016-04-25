# SER502_Compiler_and_Interpreter
Language Design Project using flex and bison for compiler and python for interpreter [Run time environment]

Steps to generate G28.g28 executable

1. flex G28.l
2. bison -d G28.y
3. gcc -o G28.g28 lex.yy.c G28.tab.c -ll -lm

Steps to compile .g28 code

1. ./G28.g28 <file-name>.g28

Steps to interpret and run code 

JAVA:

1. javac G28Run.java
2. java G28Run <file-name>.g28.int


C#:

1. mcs G28Run.cs
2. mono G28Run.exe <file-name>.g28.int
