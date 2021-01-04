#조건에 맞는 데이터만 추출하기 
library(dplyr)
exam <- read.csv("csv_exam.csv")
exam

#exam에서 class가 1인 경우만 추출해 출력
#filter() 행추출
exam %>% filter(class == 1) #dplyr패키지는 %>%(파이프 연산자) 이용해 함수들을 나열 ctrl+shift+M

#2반인 경우만 추출 
exam %>% filter(class == 2)

#1반이 아닌 경우
exam %>% filter(class != 1)

#3반이 아닌 경우 
exam %>% filter(class != 3)

#수학 점수가 50점을 초과한 경우 
exam %>% filter(math > 50)

#수학 점수가 50점 미만인 경우 
exam %>%  filter(math < 50)

#영어 점수가 80점 이상인 경우
exam %>% filter(english >= 80)

#영어 점수가 80점 이하인 경우 
exam %>% filter(english <= 80)

#1반이면서 수학 점수가 50점 이상인 경우 
exam %>% filter(class ==1 & math >= 50) #and: &, or: |

#2반이면서 영어 점수가 80점 이상인 경우 
exam %>% filter(class ==2 & english >= 80)

#수학 점수가 90점 이상이거나 영어 점수가 90점 이상인 경우 
exam %>% filter(math >= 90 | english >= 90)

#영어 점수가 90점 미만이거나 과학 점수가 50점 미만
exam %>% filter(english < 90 | science < 50 )

# 1, 3, 5반에 해당하면 추출
exam %>% filter(class == 1 | class == 3 | class == 5)

# %in%(매치 연산자) 는 변수의 값이 지정한 조건 목록에 해당하는지 확인 
# c()함수와 사용
exam %>%  filter(class %in% c(1, 3, 5))

# <-기호 이용하여 추출한 행으로 새로운 데이터 생성
# 1반과 2반 추출해 각각 새 데이터로 만든 후 각 반의 수학 점수 평균 구하기
class1 <- exam %>% filter(class ==1)
class2 <- exam %>% filter(class ==2)
mean(class1$math)
mean(class2$math)

# 조건을 지정할 때 사용하는 기호: 논리 연산자(logical operators) <, > |, %in%
# 계산할 때 사용하는 기호: 산술 연산자(arithmetic operators) +, -, %/%(나눗셈의 몫), %%(나눗셈의 나머지)
