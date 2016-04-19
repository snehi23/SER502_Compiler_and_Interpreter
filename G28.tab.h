/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     LFLOWER = 258,
     RFLOWER = 259,
     LSQUARE = 260,
     RSQUARE = 261,
     FUNCTIONL = 262,
     FUNCTIONR = 263,
     LPAREN = 264,
     RPAREN = 265,
     ASSIGN = 266,
     GREATER = 267,
     LESS = 268,
     PLUS = 269,
     SUB = 270,
     MULTIPLY = 271,
     DIV = 272,
     IF = 273,
     ELSE = 274,
     WHILE = 275,
     FUNCTION = 276,
     READ = 277,
     PRINT = 278,
     CALLFUNCTION = 279,
     RETURN = 280,
     END = 281,
     NUM = 282,
     VAR = 283
   };
#endif
/* Tokens.  */
#define LFLOWER 258
#define RFLOWER 259
#define LSQUARE 260
#define RSQUARE 261
#define FUNCTIONL 262
#define FUNCTIONR 263
#define LPAREN 264
#define RPAREN 265
#define ASSIGN 266
#define GREATER 267
#define LESS 268
#define PLUS 269
#define SUB 270
#define MULTIPLY 271
#define DIV 272
#define IF 273
#define ELSE 274
#define WHILE 275
#define FUNCTION 276
#define READ 277
#define PRINT 278
#define CALLFUNCTION 279
#define RETURN 280
#define END 281
#define NUM 282
#define VAR 283




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 36 "G28.y"
{

	int val;  
	char *string;
}
/* Line 1529 of yacc.c.  */
#line 111 "G28.tab.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

