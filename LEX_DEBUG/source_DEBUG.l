%{
#include <math.h>
#include <stdio.h>
#include <stdlib.h>


extern int yywrap(void)
{
    return 1;
}

int main(void)
{
    yylex();
    return 0;

}
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
PRINT       "printf"
QMARK       "\""
GAP         ({TAB}|{SPACE}|{ENDLINE})+



%%
{IF}                                    {printf(" #if# ");}
{ELSE}                                  {printf(" #else# ");};
{WHILE}                                 {printf(" #while# ");};
{Main}                                  {printf(" #main# ");};
{CONSTDEF}                              {printf(" #const# ");};
{INTDEF}                                {printf(" #int# ");};
{VARNAME}                               {printf(" #Variable name# ");};
{Number}                                {
                                            //yylval.number = atoi(yytext);
                                            printf(" #Number# ");
                                        };
{ENDINST}                               {printf(" #ENDINST#\n");};
{QMARK}                                 {printf(" #QMARK# ");};
{OB}                                    {printf(" #Function start# \n");};
{CB}                                    {printf(" #Function end# \n");};
{OP}                                    {printf(" #Parenthesis start# ");};
{CP}                                    {printf(" #Parenthesis end# ");};
{ADD}                                   {printf(" #ADD# ");};
{SUB}                                   {printf(" #SUB# ");};
{MUL}                                   {printf(" #MUL# ");};
{DIV}                                   {printf(" #DIV# ");};
{SEP}                                   {printf(" #SEP# ");};
{EQUALS}                                {printf(" #EQUALS# ");};
{ENDLINE}                               ;     
{GAP}                                   ;

%%
