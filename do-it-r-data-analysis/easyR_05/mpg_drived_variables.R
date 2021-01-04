#mpg 통합 연비 변수 만들기
#cty(도시연비), hwy(고속도로 연비) 더하고 2로 나누기
mpg$total <- (mpg$cty + mpg$hwy)/2
head(mpg)
mean(mpg$total) #통합 연비 변수 평균

#조건문 활용해 파생변수 만들기
#1. 기준값 정하기
summary(mpg$total) #통합 연비 변수의 평균과 중앙값 확인
hist(mpg$total) #히스토그램 생성 
#total연비의 평균과 중앙값이 약 20이다.
#total연비가 20-25 사이에 해당하는 자동차 모델이 가장 많다.
#대부분 25 이하.
#기준점- 20

#2. 합격 판정 변수 만들기
#ifelse(조건, 조건에 맞을 때 부여, 조건에 맞지 않을 때 부여)
mpg$test <- ifelse(mpg$total >= 20, "pass", "fail")
head(mpg, 20)

#3. 빈도표로 합격 판정 자동차 수 살펴보기
table(mpg$test) #연비 합격 빈도표 생성 

#4. 막대 그래프로 빈도 표현하기
library(ggplot2) #ggplot2 로드
qplot(mpg$test) #연비 합격 빈도 막대 그래프 생성 

#중첩 조건문 활용하기
#세 가지 이상의 범주로 값을 부여하려면 ifelse() 안에 다시 ifelse()를 넣는 형식으로 조건문을 중첩한다.
mpg$grade <- ifelse(mpg$total >= 30, "A",
                    ifelse(mpg$total >= 20, "B", "C"))
head(mpg, 20)
table(mpg$grade) #등급 빈도표 생성 
qplot(mpg$grade)

#세 개의 ifelse()를 중첩해 네 범주의 등급을 부여하기
mpg$grade2 <- ifelse(mpg$total >= 30, "A",
                     ifelse(mpg$total >= 25, "B",
                            ifelse(mpg$total >= 20, "C", "D")))
