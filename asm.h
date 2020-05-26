#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct instruction {
    char* inst;
    int arg1;
    int arg2;
    int arg3;
} instruction;

instruction *instructionsTab;
int currentSize;

void init_asm();

int add_inst(char* inst, int arg1, int arg2, int arg3);
void modify_inst(int value, int line);
void modify_else(int value, int line);

int get_nextLine();
int get_nextJMF(int cur);
void print_tab();