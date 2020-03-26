%{
#include <stdio.h>
#include <string.h>
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

instruction: ligne instruction
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

definition:     tINTDEF valuedefs
                |
                tCONSTDEF valuedefs;

valuedefs:      valuedef
                |
                valuedef tSEP valuedefs;

valuedef:       tVARNAME
                |
                tVARNAME tEQUALS tNUMBER;

if:             tIF tOP tCP tOB instruction tCB
                |
                tIF tOP tCP tOB instruction tCB tELSE tOB instruction tCB;

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

    yyparse();
}

