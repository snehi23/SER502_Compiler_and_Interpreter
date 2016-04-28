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
     STRING = 272,
     ASSIGN = 273,
     GREATER = 274,
     LESS = 275,
     AND = 276,
     OR = 277,
     NOT = 278,
     TRUE = 279,
     FALSE = 280,
     PLUS = 281,
     SUB = 282,
     MULTIPLY = 283,
     DIV = 284,
     IF = 285,
     ELSE = 286,
     WHILE = 287,
     FUNCTION = 288,
     READ = 289,
     PRINT = 290,
     CALLFUNCTION = 291,
     RETURN = 292,
     END = 293,
     NUM = 294,
     VAR = 295
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
#define STRING 272
#define ASSIGN 273
#define GREATER 274
#define LESS 275
#define AND 276
#define OR 277
#define NOT 278
#define TRUE 279
#define FALSE 280
#define PLUS 281
#define SUB 282
#define MULTIPLY 283
#define DIV 284
#define IF 285
#define ELSE 286
#define WHILE 287
#define FUNCTION 288
#define READ 289
#define PRINT 290
#define CALLFUNCTION 291
#define RETURN 292
#define END 293
#define NUM 294
#define VAR 295




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

