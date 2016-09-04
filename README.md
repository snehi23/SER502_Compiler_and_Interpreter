# SER502_Compiler_and_Interpreter
Language Design Project using flex and bison for compiler and C# for interpreter [Run time environment]

Steps to generate G28.g28 executable

1. flex LOL.l
2. bison -d LOL.y
3. gcc -o Compiler_Lol lex.yy.c LOL.tab.c -ll -lm

Steps to compile .lol code

1. ./Compiler_Lol [file-name].lol

Steps to interpret and run code [on Windows/mac OSX/LINUX]

1. mcs Runtime_Lol.cs
2. mono Runtime_Lol.exe [file-name].lol.asm

Installation Note:

Steps to install mono framework on

a) mac OSX

1. Download Mono 32-bit from http://www.mono-project.com/download/  (Works on 64 bit machines too)
2. Follow the installation guidelines from http://www.mono-project.com/docs/about-mono/supported-platforms/osx/

b) Windows

1. Download Mono 32-bit from http://www.mono-project.com/download/  (Works on 64 bit machines too)
2. Follow the installation guidelines from http://www.mono-project.com/docs/getting-started/install/windows/

c) LINUX

Run the following commands from the terminal:

1) sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF

2) echo "deb http://download.mono-project.com/repo/debian wheezy-apache24-compat main" | sudo tee -a /etc/apt/sources.list.d/mono-xamarin.list

3) sudo apt-get update

4) sudo apt-get install mono-mcs
