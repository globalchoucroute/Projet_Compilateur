main ( )
{
    int compteur = 4;
    int resultat = 0-10;
    while (compteur) {
        resultat = resultat + 5;
        compteur = compteur - 1;
        if (resultat) {
            printf (resultat);
        }
        else {
            int a = 2;
            int i,j,k = 5;
            j = 3;
            i = compteur * (j + k) / a;
            printf (i);
        }
    }
    printf(resultat);
}
