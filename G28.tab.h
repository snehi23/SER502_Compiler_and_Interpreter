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
     HASH = 272,
     DOLLAR = 273,
     ASSIGN = 274,
     GREATER = 275,
     LESS = 276,
     AND = 277,
     OR = 278,
     NOT = 279,
     TRUE = 280,
     FALSE = 281,
     PLUS = 282,
     SUB = 283,
     MULTIPLY = 284,
     DIV = 285,
     IF = 286,
     ELSE = 287,
     WHILE = 288,
     FUNCTION = 289,
     READ = 290,
     PRINT = 291,
     CALLFUNCTION = 292,
     RETURN = 293,
     END = 294,
     NUM = 295,
     VAR = 296,
     STRING = 297
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
#define HASH 272
#define DOLLAR 273
#define ASSIGN 274
#define GREATER 275
#define LESS 276
#define AND 277
#define OR 278
#define NOT 279
#define TRUE 280
#define FALSE 281
#define PLUS 282
#define SUB 283
#define MULTIPLY 284
#define DIV 285
#define IF 286
#define ELSE 287
#define WHILE 288
#define FUNCTION 289
#define READ 290
#define PRINT 291
#define CALLFUNCTION 292
#define RETURN 293
#define END 294
#define NUM 295
#define VAR 296
#define STRING 297




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 39 "G28.y"
{
	int val;
	char *string;
}
/* Line 1529 of yacc.c.  */
#line 138 "G28.tab.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

