install.packages("ggplot2") #ggplot2 패키지 설치
yes
library(ggplot2) #ggplot2 패키지 로드

x<- c("a", "a", "b", "c") #여러 문자로 구성된 변수 생성
x

qplot(x) #빈도 막대 그래프 출력 

qplot(data = mpg, x = hwy) #data에 mpg(1999-2008 출시된 자동차 234종의 연비 관련 정보), x축에 hwy(자동차가 고속도로에서 1갤런에 몇 마일을 가는지) 변수 지정 

qplot(data = mpg, x = cty) #x축 cty 

qplot(data = mpg, x = drv, y = hwy)

qplot(data = mpg, x = drv, y = hwy, geom = "line") #선그래프 형태 

qplot(data = mpg, x = drv, y = hwy, geom = "boxplot") #상자 그림 형태

qplot(data = mpg, x = drv, y = hwy, geom = "boxplot", colour = drv) #drv별 색 표현 

?qplot #qplot 함수 매뉴얼 출력 
