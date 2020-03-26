%{
#include <stdio.h>
#include <string.h>
#include "symboltable.h"
%}

%union {
    int number;
    char *string;
}

%right          tEQUALS
%left           tADD tSUB
%left           tMUL tDIV
%left           tOP tCP
%token <number> tNUMBER
%token <string> tVARNAME 
%token          tIF tELSE tWHILE tMain tCONSTDEF tINTDEF tENDINST tQMARK tOB tCB tSEP tPRINTF tGAP

%start start
%%

start: main

main:       tMain tOP tCP tOB instruction tCB;

instruction:    ligne instruction
                | 
                ligne;

ligne:      expression tENDINST
            |
            definition tENDINST
            |
            printf tENDINST
            |
            if;

expression:     tNUMBER
                |
                tVARNAME
				|
                expression  tADD expression 
                |
                expression tSUB expression 
                |
                expression tMUL expression 
                |
                expression tDIV expression
                |
                expression tEQUALS expression
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
                    int a = getAddress(varname);
                    printf("addresse de la variable : %d\n ", a);
                    }
                |
                tVARNAME tEQUALS tNUMBER {
                    int value = $3;
                    char *varname = $1;
                    addSymbol(varname, 0, 1);
                    int a = getAddress(varname);
                    printf("addresse de la variable : %d\n ", a);
                    };

constdefs:      constdef
                |
                constdef tSEP constdefs;

constdef:       tVARNAME tEQUALS tNUMBER {
                    int value = $3;
                    char *varname = $1;
                    addSymbol(varname, 1, 1);
                    int a = getAddress(varname);
                    printf("addresse de la variable : %d\n ", a);
                    };

if:             tIF statement tOB instruction tCB
                |
                tIF statement tOB instruction tELSE tOB instruction tCB;

statement:      tOP tCP;

printf:         tPRINTF tOP tVARNAME tCP;

%%

void yyerror(const char *str)
{
    fprintf(stderr,"error: %s\n",str);
}

int yywrap()
{
    return 1;
}

int main(void)
{
    printf("Enter an expression\n");
    init();
    yyparse();
}

