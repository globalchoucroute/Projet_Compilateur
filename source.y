%{
#include <stdio.h>
#include <string.h>
#include "symboltable.h"
#include "asm.h"

int yylex();
void yyerror();
int index_temp = 100;
int tmp;
%}

%union {
    int number;
    char *string;
}

%right          tEQUALS
%left           tADD tSUB
%left           tMUL tDIV
%left           tOP tCP
%token <number> tNUMBER tIF tELSE tWHILE 
%token <string> tVARNAME 
%token          tMain tCONSTDEF tINTDEF tENDINST tQMARK tOB tCB tSEP tPRINTF tGAP tLT tGT

%type <number>  if_facto while 
%start start
%%

start: main

main:       tMain tOP tCP openingB instruction closingB;

openingB:       tOB {
                        incrementDepth();
                    };

closingB:       tCB {
                        decrementDepth();
                    };

instruction:    ligne instruction
                | 
                ligne;

ligne:      expression tENDINST
            |
            definition tENDINST
            |
            printf tENDINST
            |
            if
            |
            while;

expression:     tNUMBER                         {
                                                    add_inst("AFC", index_temp, $1, 0);
                                                    index_temp++;
                                                }
                |
                tVARNAME                        {
                                                    symbole *s = exists($1);
                                                    int addr = s->address;
                                                    tmp = add_inst("COP", index_temp, addr, 0);
                                                    index_temp ++;
                                                }
				|
                expression tADD expression      {
                                                    index_temp--;
                                                    tmp = add_inst("ADD", index_temp -1, index_temp -1, index_temp);
                                                }      
                |
                expression tSUB expression      {
                                                    index_temp--;
                                                    tmp = add_inst("SUB", index_temp -1, index_temp -1, index_temp);
                                                }      
                |
                expression tMUL expression      {
                                                    index_temp--;
                                                    tmp = add_inst("MUL", index_temp -1, index_temp -1, index_temp);
                                                }      
                |
                expression tDIV expression      {
                                                    index_temp--;
                                                    tmp = add_inst("DIV", index_temp -1, index_temp -1, index_temp);
                                                }      
                |
                tNUMBER tEQUALS expression   
                |
                tVARNAME tEQUALS expression     {
                                                    char *varname = $1;
                                                    symbole *s = exists(varname);
                                                    int addr = s->address;
                                                    tmp = add_inst("COP", addr, index_temp - 1, 0);
                                                }
                |
                tOP expression tCP;

definition:     tINTDEF intdefs
                |
                tCONSTDEF constdefs;

intdefs:        intdef
                |
                intdef tSEP intdefs;

intdef:         tVARNAME {
                    char *varname = $1;
                    addSymbol(varname, 0, 0);
                    }
                |
                tVARNAME tEQUALS expression {
                    char *varname = $1;
                    addSymbol(varname, 0, 1);
                    symbole *s = exists(varname);
                    int addr = s->address;
                    tmp = add_inst("COP", addr, index_temp - 1, 0);
                    index_temp = 100;
                    };

constdefs:      constdef
                |
                constdef tSEP constdefs;

constdef:       tVARNAME tEQUALS expression {
                    char *varname = $1;
                    addSymbol(varname, 1, 1);
                    symbole *s = exists(varname);
                    int addr = s->address;
                    tmp = add_inst("COP", addr, index_temp - 1, 0);
                    index_temp = 100;
                    };

if:             if_facto {
                    modify_inst($1, get_nextLine());
                }
                |
                if_facto tELSE {
                    $2 = add_inst("JMP", $1, -1, 0);
                    modify_inst($1, get_nextLine());
                }
                openingB instruction closingB {
                    modify_else($2, get_nextLine());
                };

if_facto:       tIF tOP expression tCP {
                    $1 = add_inst("JMF", index_temp-1, -1, 0);
                    index_temp = 100;
                }
                openingB instruction closingB  {
                    $$ = $1;
                };

while:          tWHILE {$1 = get_nextLine();} tOP expression tCP {
                    add_inst("JMF", index_temp-1, -1, 0);
                    index_temp = 100;
                } openingB instruction closingB {
                    add_inst("JMP", $1, -1, 0);
                    modify_inst(get_nextJMF($1), get_nextLine());
                };

printf:         tPRINTF tOP tVARNAME tCP {
                    char *varname = $3;
                    symbole *s = exists(varname);
                    int addr = s->address;
                    tmp = add_inst("PRI", addr, -1, -1);
                };

%%


int yywrap()
{
    return 1;
}

int main(void)
{   
    init();
    init_asm();
    yyparse();
    print_tab();
}

