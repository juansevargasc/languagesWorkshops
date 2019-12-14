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
     IMPRIMIR = 258,
     ESCRIBIR = 259,
     LEER = 260,
     EXIT = 261,
     NULLTOKEN = 262,
     TKN_PREDARIT = 263,
     TKN_PREDALGE = 264,
     TKN_NUMBER = 265,
     TKN_PUNCTUATION = 266,
     TKN_OPEREL = 267,
     TKN_OPERARIT = 268,
     TKN_LOGICOPER = 269,
     TKN_LOGICVAL = 270,
     TKN_VARINT = 271
   };
#endif
/* Tokens.  */
#define IMPRIMIR 258
#define ESCRIBIR 259
#define LEER 260
#define EXIT 261
#define NULLTOKEN 262
#define TKN_PREDARIT 263
#define TKN_PREDALGE 264
#define TKN_NUMBER 265
#define TKN_PUNCTUATION 266
#define TKN_OPEREL 267
#define TKN_OPERARIT 268
#define TKN_LOGICOPER 269
#define TKN_LOGICVAL 270
#define TKN_VARINT 271




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 14 "talleryacc.y"
{bool logic; char id[]; int num;}
/* Line 1529 of yacc.c.  */
#line 83 "y.tab.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

