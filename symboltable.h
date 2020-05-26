typedef struct element {
    char *id;
    int address;
    int isConst;
    int isInit;
    int depth;
} symbole;

symbole **symboltable;
int *numberOfVariables;
int depth;
int currentAddress;

void init();

void addSymbol(char* id, int isConst, int isInit);

void changeSymbol(char *id);

void incrementDepth();

void decrementDepth();

int getAddress(char *id);

symbole *exists(char *id);
