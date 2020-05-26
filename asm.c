#include "symboltable.h"
#include "asm.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define size 2048

void init_asm(){
    instructionsTab = malloc(size*sizeof(instruction));
    currentSize = 0;
}

int add_inst(char* inst, int arg1, int arg2, int arg3){
    instruction new_inst;
    new_inst.inst = inst;
    new_inst.arg1 = arg1;
    new_inst.arg2 = arg2;
    new_inst.arg3 = arg3;
    instructionsTab[currentSize] = new_inst;
    currentSize += 1;
    return currentSize - 1;
}

void modify_inst(int value, int line){
    instructionsTab[value].arg2 = line;
}
void modify_else(int value, int line){
    instructionsTab[value].arg1 = line;
}
int get_nextLine(){
    return currentSize;
}
int get_nextJMF(int cur){
    int index = -1;
    for (int i = cur; i < currentSize; i++){
        if(strcmp(instructionsTab[i].inst, "JMF") == 0){
            index = i;
            break;
        }
    }
    return index;
}
void print_tab(){
    instruction curr;
    for(int i = 0; i<currentSize; i++){
        curr = instructionsTab[i];
        if (instructionsTab[i].arg2 == -1){
            printf("%s %d\n", curr.inst, curr.arg1);
        }
        else if (instructionsTab[i].arg3 == 0){
            printf("%s %d %d\n", curr.inst, curr.arg1, curr.arg2);
        }
        else {
            printf("%s %d %d %d\n", curr.inst, curr.arg1, curr.arg2, curr.arg3);
        }
    }
}