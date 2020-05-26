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
LT          "<"
GT          ">"
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
{IF}            {return tIF;}
{ELSE}          {return tELSE;};
{WHILE}         {return tWHILE;};
{Main}          {return tMain;};
{CONSTDEF}      {return tCONSTDEF;};
{INTDEF}        {return tINTDEF;};
{PRINTF}        {return tPRINTF;};
{VARNAME}       {
                    yylval.string = strdup(yytext);
                    return tVARNAME;
                };
{Number}        {
                    yylval.number = atoi(yytext);
                    return tNUMBER;
                };
{ENDINST}       {return tENDINST;};
{QMARK}         {return tQMARK;};
{OB}            {return tOB;};
{CB}            {return tCB;};
{OP}            {return tOP;};
{CP}            {return tCP;};
{ADD}           {return tADD;};
{SUB}           {return tSUB;};
{MUL}           {return tMUL;};
{DIV}           {return tDIV;};
{SEP}           {return tSEP;};
{LT}            {return tLT;};
{GT}            {return tGT;};
{EQUALS}        {return tEQUALS;};    
{GAP}           ;

