yacc -d source.y
lex source.l
yacc source.y
gcc y.tab.c lex.yy.c -o borisenY
gcc symboltable.c -o rubenenY