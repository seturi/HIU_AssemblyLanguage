#include <stdio.h>

int main(){
    int a = 100;
    int b = 15;
    int minus, multi, division;

    minus = a - b;
    multi = a * b;
    division = a / b;
    
    printf(" 100 - 15 = %d\n", minus);
    printf(" 100 * 15 = %d\n", multi);
    printf(" 100 / 15 = %d\n", division);
}