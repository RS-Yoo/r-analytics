# 결측치 찾기
# R에서 결측치는 NA로 표기
df <- data.frame(sex = c("M", "F", NA, "M", "F"),
                 score = c(5, 4, 3, 4, NA))
df

# is.na()를 이용해 결측치 확인(결측치는 TRUE, 결측치가 아닌 값은 FALSE)
is.na(df)
table(is.na(df)) #결측치 빈도 출력

# 결측치 제거하기
# is.na()를 filter()에 적용하면 결측치가 있는 행을 제거할 수 있다.
library(dplyr)
df %>% filter(is.na(score)) # score가 NA인 데이터만 출력 

# !is.na()를 입력하면 결측치가 아닌 값을 의미
# filter()에 적용하면 결측치를 제외하고 행 추출 
df %>% filter(!is.na(score)) #score 결측치 제거 

# 결측치 제거한 score 평균 산출
df_nomiss <- df %>% filter(!is.na(score))
mean(df_nomiss$score)

# filter()에 &기호 이용해 조건을 나열하면 여러 변수에 모두 결측치가 없는 행 추출 가능
df_nomiss <- df %>% filter(!is.na(score) & !is.na(sex))
df_nomiss

# na.omit()으로 변수를 지정하지 않고 결측치가 있는 행을 한 번에 제거
df_nomiss2 <- na.omit(df)
df_nomiss2

# 수치 연산 함수들은 결측치를 제외하고 연산하도록 설정하는 na.rm 파라미터 지원
# na.rm을 TRUE로 설정하면 결측치를 제외하고 함수를 적용 
mean(df$score, na.rm = T)
sum(df$score, na.rm = T)

# summarise()를 이용해 요약 통계량을 산출할 때도 적용 가능
exam <- read.csv("csv_exam.csv") #데이터 불러오기 
exam[c(3, 8, 15), "math"] <- NA # 3, 8, 15행의 math에 NA 할당
exam

# math 결측치 제외하고 평균 산출
exam %>% summarise(mean_math = mean(math, na.rm = T))

# 결측치 대체법(결측치를 다른 값으로 대체해 데이터 손실로 분석 결과가 왜곡되는 문제 보완)
# 평균값으로 결측치 대체하기

# math 결측치를 평균값으로 대체
mean(exam$math, na.rm = T) # 결측치 제외하고 math 평균 산출

#ifelse()를 이용해 NA 값을 평균값으로 대체
exam$math <- ifelse(is.na(exam$math), 55, exam$math)
table(is.na(exam$math))
exam

mean(exam$math)
