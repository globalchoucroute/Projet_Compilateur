#include "symboltable.h"
#include <stdio.h>
#include <stdlib.h>

#define false 0
#define true 1
#define size 64

void init(){
    depth = 0;
    currentAddress = 0;
    symboltable = malloc(size * sizeof(symbole));
}

void addSymbol(char* id, int isConst, int isInit){
    symbole new;
    new.id = id;
    new.address = currentAddress;
    new.depth = depth;
    new.isConst = isConst;
    new.isInit = isInit;
    symboltable[currentAddress] = new;
    printf("nom de la variable : %s ", new.id);
    if (isInit) printf("(initialisée) ");
    currentAddress += 1;
}

void incrementDepth(){
    depth += 1;
}

void decrementDepth(){
    depth -= 1;
}

int getAddress(char* id){
    int address = 0;
    for (int i=0; i< size; i++) {
        if (symboltable[i].id == id){
            address = symboltable[i].address;
        }
    }
    return address;
} 
