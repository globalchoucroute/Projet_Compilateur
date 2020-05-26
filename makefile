all:make

make:
	yacc -d source.y
	lex source.l
	yacc source.y
	gcc y.tab.c lex.yy.c symboltable.c asm.c -ly -ll -o out