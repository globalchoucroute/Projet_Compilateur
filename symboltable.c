#include "symboltable.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define false 0
#define true 1
#define size 64
#define depth_size 64

void init(){
    depth = 0;
    currentAddress = 0;

    symboltable = malloc(depth_size * sizeof(symbole *));
    symboltable[depth] = malloc(size*sizeof(symbole));
    
    numberOfVariables = malloc(depth_size * sizeof(int));
    numberOfVariables[depth] = 0;
}

void addSymbol(char* id, int isConst, int isInit){
    if (exists(id) == NULL){
        symbole new;
        new.id = id;
        new.address = currentAddress;
        new.depth = depth;
        new.isConst = isConst;
        new.isInit = isInit;
        symboltable[depth][numberOfVariables[depth]] = new;
        currentAddress += 1;
        numberOfVariables[depth] += 1;
    }
    else if ((exists(id) != NULL) && (exists(id)->depth <= depth)){
        exit(-1);
    }
}


void incrementDepth(){
    depth += 1;
    symboltable[depth] = malloc(size*sizeof(symbole));
}

void decrementDepth(){
    free(symboltable[depth]);
    depth -= 1;
}

int getAddress(char* id){
    int address = 0;
    if (exists(id) != NULL){
        address = exists(id)->address;
    }
    return address;
}

symbole* exists(char *id){
    for (int i=0; i<=depth; i++) {
        for (int j = 0; j<numberOfVariables[i]; j++){
            if (strcmp(symboltable[i][j].id, id) == 0){
                return &symboltable[i][j];
            }
        }
    }
    return NULL;
}