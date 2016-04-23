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
     STACK = 266,
     PUSH = 267,
     POP = 268,
     PEEK = 269,
     ASSIGN = 270,
     GREATER = 271,
     LESS = 272,
     AND = 273,
     OR = 274,
     NOT = 275,
     TRUE = 276,
     FALSE = 277,
     PLUS = 278,
     SUB = 279,
     MULTIPLY = 280,
     DIV = 281,
     IF = 282,
     ELSE = 283,
     WHILE = 284,
     FUNCTION = 285,
     READ = 286,
     PRINT = 287,
     CALLFUNCTION = 288,
     RETURN = 289,
     END = 290,
     NUM = 291,
     VAR = 292
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
#define STACK 266
#define PUSH 267
#define POP 268
#define PEEK 269
#define ASSIGN 270
#define GREATER 271
#define LESS 272
#define AND 273
#define OR 274
#define NOT 275
#define TRUE 276
#define FALSE 277
#define PLUS 278
#define SUB 279
#define MULTIPLY 280
#define DIV 281
#define IF 282
#define ELSE 283
#define WHILE 284
#define FUNCTION 285
#define READ 286
#define PRINT 287
#define CALLFUNCTION 288
#define RETURN 289
#define END 290
#define NUM 291
#define VAR 292




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 38 "G28.y"
{

	int val;
	char *string;
}
/* Line 1529 of yacc.c.  */
#line 129 "G28.tab.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

