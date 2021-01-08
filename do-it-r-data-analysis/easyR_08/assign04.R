#class가 compact, subcompact, suv인 자동차의 cty 비교를 위해 세 차종의 cty를 나타낸 상자 그림 만들기
mpg <- as.data.frame(ggplot2::mpg)
df_new <- mpg %>% filter(class %in% c("compact", "subcompact", "suv"))
ggplot(data=df_new, aes(x=class, y=cty)) + geom_boxplot()
