%{
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
%}

Digit       [0-9]
Char        [a-z]|[A-Z]
Sign        [-+]?
CONSTDEF    "const "
INTDEF      "int "
Main        main
IF          if
ELSE        else
WHILE       while
VARNAME     {Char}({Char}|{Digit}|"_")*
Integer     {Digit}+
Real        {Integer}"."{Digit}*
Number      {Integer}|{Real}
Exp         [Ee]{Sign}{Digit}+
ADD         "+"
SUB         "-"
MUL         "*"
DIV         "/"
EQUALS      "="
OB          "{"
CB          "}"
OP          "("
CP          ")"
ENDINST     ";"
SPACE       " "
TAB         \t
SEP         ","
ENDLINE     \n
PRINTF       printf
QMARK       "\""
GAP         ({TAB}|{SPACE}|{ENDLINE})+



%%
{IF}                                    {printf(" #if# "); return tIF;}
{ELSE}                                  {printf(" #else# "); return tELSE;};
{WHILE}                                 {printf(" #while# "); return tWHILE;};
{Main}                                  {printf(" #main# "); return tMain;};
{CONSTDEF}                              {printf(" #const# ");return tCONSTDEF;};
{INTDEF}                                {printf(" #int# "); return tINTDEF;};
{PRINTF}                                {printf(" #printf# "); return tPRINTF;};
{VARNAME}                               {printf(" #Variable name# "); return tVARNAME;};
{Number}                                {
                                            yylval.number = atoi(yytext);
                                            printf(" #Number# ");
                                            return tNUMBER;
                                        };
{ENDINST}                               {printf(" #ENDINST# \n"); return tENDINST;};
{QMARK}                                 {printf(" #QMARK# "); return tQMARK;};
{OB}                                    {printf(" #Function start# \n"); return tOB;};
{CB}                                    {printf(" #Function end# \n"); return tCB;};
{OP}                                    {printf(" #Parenthesis start# "); return tOP;};
{CP}                                    {printf(" #Parenthesis end# "); return tCP;};
{ADD}                                   {printf(" #ADD# "); return tADD;};
{SUB}                                   {printf(" #SUB# "); return tSUB ;};
{MUL}                                   {printf(" #MUL# "); return tMUL;};
{DIV}                                   {printf(" #DIV# "); return tDIV;};
{SEP}                                   {printf(" #SEP# "); return tSEP;};
{EQUALS}                                {printf(" #EQUALS# "); return tEQUALS;};    
{GAP}                                   ;

