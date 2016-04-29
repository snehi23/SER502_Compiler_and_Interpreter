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
     PARAML = 262,
     PARAMR = 263,
     FUNCTIONL = 264,
     FUNCTIONR = 265,
     LPAREN = 266,
     RPAREN = 267,
     STACK = 268,
     PUSH = 269,
     POP = 270,
     PEEK = 271,
     ASSIGN = 272,
     GREATER = 273,
     LESS = 274,
     AND = 275,
     OR = 276,
     NOT = 277,
     TRUE = 278,
     FALSE = 279,
     PLUS = 280,
     SUB = 281,
     MULTIPLY = 282,
     DIV = 283,
     IF = 284,
     ELSE = 285,
     WHILE = 286,
     FUNCTION = 287,
     READ = 288,
     PRINT = 289,
     CALLFUNCTION = 290,
     RETURN = 291,
     END = 292,
     NUM = 293,
     VAR = 294,
     STRING = 295
   };
#endif
/* Tokens.  */
#define LFLOWER 258
#define RFLOWER 259
#define LSQUARE 260
#define RSQUARE 261
#define PARAML 262
#define PARAMR 263
#define FUNCTIONL 264
#define FUNCTIONR 265
#define LPAREN 266
#define RPAREN 267
#define STACK 268
#define PUSH 269
#define POP 270
#define PEEK 271
#define ASSIGN 272
#define GREATER 273
#define LESS 274
#define AND 275
#define OR 276
#define NOT 277
#define TRUE 278
#define FALSE 279
#define PLUS 280
#define SUB 281
#define MULTIPLY 282
#define DIV 283
#define IF 284
#define ELSE 285
#define WHILE 286
#define FUNCTION 287
#define READ 288
#define PRINT 289
#define CALLFUNCTION 290
#define RETURN 291
#define END 292
#define NUM 293
#define VAR 294
#define STRING 295




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 38 "G28.y"
{
	int val;
	char *string;
}
/* Line 1529 of yacc.c.  */
#line 134 "G28.tab.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

