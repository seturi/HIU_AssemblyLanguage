/*
두 정수 a, b 의 최대공약수를 G(a, b) 라고 하자 . 정수 a, b, q r (b 0) 에 대하여
a = bq + r, 이면 G(a, b) = G(b, r) 가 성립한다
*/
#include <stdio.h>

int main() {
    int a, b, r;
    int flag = 1;
    printf("두 정수를 입력하시오: ");
    scanf("%d%d",&a, &b);
    while(a != b) {
        if (a > b) {
            r = a - b;
            a = b;
            b = r;
            flag = 0;
        }
        else {
            r = b - a;
            b = a;
            a = r;
        }
    }
    if (flag == 1) {
        printf("최대공약수는 %d 입니다.\n", a);
    }
    else {
        printf("최대공약수는 %d입니다.\n", b);
    }
    return 0;
}