typedef struct element {
    char *id;
    int address;
    int isConst;
    int isInit;
    int depth;
} symbole;

symbole *symboltable;
int depth;
int currentAddress;

void init();

void addSymbol(char* id, int isConst, int isInit);

void incrementDepth();

void decrementDepth();

int getAddress(char *id);
