#변수 조합해 파생변수 만들기

#데이터 프레임 생성
df <- data.frame(var1 = c(4, 3, 8),
                 var2 = c(2, 6, 1))
df

#데이터 프레임명에 $붙여 새로 만들 변수명 입력, <-로 계산 공식 할당
df$var_sum <- df$var1 + df$var2
df

df$var_mean <- (df$var1 + df$var2)/2
df
