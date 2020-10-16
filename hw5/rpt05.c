#include <stdio.h>
int main() {
    int a;
    char b;
    short c;
    int d;
    short e;
    int total;
    printf("int, char, short, int, short 타입순으로 값을 입력하시오 ");
    scanf("%d %hhd %hd %d %hd", &a, &b, &c, &d, &e);
    total = a + b + c + d + e;

    printf("total = %d\n", total);

    return 0;
}