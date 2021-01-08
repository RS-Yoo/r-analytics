#psavert의 변화를 나타낸 시계열 그래프
library(ggplot2)
ggplot(data= economics, aes(x= date, y= psavert)) + geom_line()
