#include <stdio.h>

int main() {
    int year;
    
    while(1) {
        print("년도를 입력하세요(종료: 음수) ");
        scanf("%d", &year);
        
        if(year < 0) {
            break;
        }

        if(year % 400 == 0) {
            print("%d 윤년입니다.", year);
        } 
        else if((year % 4 == 0) && (year % 100 == 0)) {
                print("%d 평년입니다.", year);
        }
        else{
            print("%d 윤년입니다.", year);
        }

    return 0;
}