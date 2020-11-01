#include <stdio.h>
#define SIZE 3  // 인원수
int main() {
    struct employee_info // 구조체 정의
    {
        char name[12]; // 최대 11 개 문자 배열
        char id[10]; // 최대 9 개 문자 배열
        int salary; // 급여 저장할 정수형 멤버
    };
    struct employee_info employee[SIZE]; // 구조체 배열 선언
    int average = 0, sum = 0, i ; // 급여 평균 , 급여 합계
    printf(">>직원의 정보 이름 , ID, 급여 를 입력하세요 . <<\n");
    for (i = 0; i < SIZE; i++) {
        printf("%d번 : ", i + 1);
        scanf("%s %s %d", employee[i].name, employee[i].id, &employee[i].salary);
        sum += employee[i].salary; // 급여 합계
    }
    average = sum / SIZE; // 급여 평균(원단위)
    printf("\n---------------------\n");
    printf("급여가 %d만원(평균) 이상인 직원 정보", average);
    printf("\n---------------------\n");
    for (i=0; i<SIZE; i++) {
        if (employee[i].salary >= average)
            printf("\t%s\t%d만원\n", employee[i].id, employee[i].salary);
    }
    printf("------------------------\n");
    return 0;
}