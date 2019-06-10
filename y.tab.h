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
     ID = 258,
     STRING = 259,
     COMMENT = 260,
     TYPE = 261,
     CALLID = 262,
     INPUT = 263,
     OUTPUT = 264,
     HIGH = 265,
     LOW = 266,
     SETUP = 267,
     LOOP = 268,
     CONST = 269,
     OP = 270,
     INOUT = 271,
     HILO = 272,
     NUM = 273,
     EMPTY = 274
   };
#endif
/* Tokens.  */
#define ID 258
#define STRING 259
#define COMMENT 260
#define TYPE 261
#define CALLID 262
#define INPUT 263
#define OUTPUT 264
#define HIGH 265
#define LOW 266
#define SETUP 267
#define LOOP 268
#define CONST 269
#define OP 270
#define INOUT 271
#define HILO 272
#define NUM 273
#define EMPTY 274




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 11 "yacc.y"
{
       char* lexeme;			//identifier
       }
/* Line 1529 of yacc.c.  */
#line 91 "y.tab.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

