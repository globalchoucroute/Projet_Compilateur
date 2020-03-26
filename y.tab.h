/* A Bison parser, made by GNU Bison 3.3.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2019 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

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

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    tEQUALS = 258,
    tADD = 259,
    tSUB = 260,
    tMUL = 261,
    tDIV = 262,
    tOP = 263,
    tCP = 264,
    tNUMBER = 265,
    tVARNAME = 266,
    tIF = 267,
    tELSE = 268,
    tWHILE = 269,
    tMain = 270,
    tCONSTDEF = 271,
    tINTDEF = 272,
    tENDINST = 273,
    tQMARK = 274,
    tOB = 275,
    tCB = 276,
    tSEP = 277,
    tPRINTF = 278,
    tGAP = 279
  };
#endif
/* Tokens.  */
#define tEQUALS 258
#define tADD 259
#define tSUB 260
#define tMUL 261
#define tDIV 262
#define tOP 263
#define tCP 264
#define tNUMBER 265
#define tVARNAME 266
#define tIF 267
#define tELSE 268
#define tWHILE 269
#define tMain 270
#define tCONSTDEF 271
#define tINTDEF 272
#define tENDINST 273
#define tQMARK 274
#define tOB 275
#define tCB 276
#define tSEP 277
#define tPRINTF 278
#define tGAP 279

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 7 "source.y" /* yacc.c:1921  */

    int number;
    char *string;

#line 111 "y.tab.h" /* yacc.c:1921  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
