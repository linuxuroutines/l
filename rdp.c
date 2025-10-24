#include <stdio.h>
#include <string.h>
#include <ctype.h>
char input [10];
int i, error;
void E();
void T();
void Eprime();
void Tprime();
void F();
int main() {
    i = 0;
    error = 0;
    printf("Enter an arithmetic expression: ");
    fgets(input,sizeof(input), stdin);
    input [strcspn (input, "\n")] = '\0';
    E();
    if (strlen(input) == 1 && error == 0)
        printf("\nAccepted...!!!\n");
    else
        printf("\nRejected...!!!\n");
}
void E() {
    T();
    Eprime();
}
void Eprime() {
    if (input [i] == '+'){
        i++;
        T();
        Eprime();
    }
}
void T() {
    F();
    Tprime();
}
void Tprime() {
    if (input [i] == '*') {
        i++;
        F();
        Tprime();
    }
}
void F() {
    if (input [i] == 'i' && input [i+1] == 'd') {
        i+=2;
    } else if (input [i] == '(') {
        i++;
        E();
        if (input [i] == ')')
            i++;
        else
            error = 1;
    } else{
        error = 1;
    }
}

===== run =====
nano rdp.c
gcc rdp.c -o rdp
./rdp