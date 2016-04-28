# SER502_Compiler_and_Interpreter
Language Design Project using flex and bison for compiler and C# for interpreter [Run time environment]

Steps to generate G28.g28 executable

1. flex G28.l
2. bison -d G28.y
3. gcc -o G28.g28 lex.yy.c G28.tab.c -ll -lm

Steps to compile .g28 code

1. ./G28.g28 <file-name>.g28

Steps to interpret and run code [on Windows/mac OSX/LINUX]

1. mcs G28Run.cs
2. mono G28Run.exe <file-name>.g28.int


Installation Note:

Steps to install mono framework on 

a) mac OSX

1. Download Mono 32-bit from [http://www.mono-project.com/download/]  (Works on 64 bit machines too)
2. Follow the installation guidelines from [http://www.mono-project.com/docs/about-mono/supported-platforms/osx/]

b) Windows

1. Download Mono 32-bit from [http://www.mono-project.com/download/]  (Works on 64 bit machines too)
2. Follow the installation guidelines from [http://www.mono-project.com/docs/getting-started/install/windows/] 

c) LINUX

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF

echo "deb http://download.mono-project.com/repo/debian wheezy-apache24-compat main" | sudo tee -a /etc/apt/sources.list.d/mono-xamarin.list

sudo apt-get update

sudo apt-get install mono-mcs

