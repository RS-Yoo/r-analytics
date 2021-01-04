#ggplot2의 midwest 데이터를 데이터프레임 현태로 불러오고 특징 파악
df_midwest <- as.data.frame(ggplot2::midwest) 
head(df_midwest)
tail(df_midwest)
View(df_midwest)
dim(df_midwest)
str(df_midwest)
summary(df_midwest)

#poptotal을 total, popasian을 asian으로 수정
install.packages("dplyr")
library(dplyr)
df_midwest <- rename(df_midwest, total = poptotal)
df_midwest <- rename(df_midwest, asian = popasian)

#전체 인구 대비 아시아 인구 백분율 파생변수, 히스토그램
df_midwest$ratio <- ((df_midwest$asian)/(df_midwest$total))*100 
hist(df_midwest$ratio)

#아시아 인구 백분율 전체 평균 구하기
#초과하면 "large," 그 외에는 "small" 부여하는 파생변수
df_midwest$compare <- ifelse(df_midwest$ratio > mean(df_midwest$ratio), "large", "small")

#large, small에 해당하는 지역이 얼마나 되는지 빈도표와 빈도 막대 그래프 생성
table(df_midwest$compare)
library(ggplot2)
qplot(df_midwest$compare)
