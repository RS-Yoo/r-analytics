#mpg 데이터 파악하기 
#ggplot2의 mpg데이터를 데이터 프레임 형태로 불러오기
mpg <- as.data.frame(ggplot2::mpg) #as.data.frame()은 데이터 속성을 데이터 프레임 형태로 바꾼다. ggplot2::mpg는 ggplot2에 들어있는 mpg데이터를 지칭한다.

head(mpg) #raw 데이터 앞부분 확인
tail(mpg) #raw 데이터 뒷부분 확인 
View(mpg) #raw 데이터 뷰어 창에서 확인 
dim(mpg) #행, 열 출력
str(mpg) #데이터 속성 확인 
#chr은 문자, num은 소수점이 있는 실수(numeric)

#displ(diplacement): 배기량, cyl(cylinders): 실린더 개수, drv(drive wheel):구동 방식, hwy(highway):고속도로 연비, class:자동차 종류, trans(transmission):변속기 종류, cty(city):도시연비, fl(fuel):연료 종류 

summary(mpg) #요약 통계량 출력 
#자동차들이 도시에서 평균적으로 갤런당 16.86마일을 주행한다(mean).
#연비가 가장 낮은 모델은 갤런당 9마일(min), 높은 모델은 35마일(max)을 주행한다.
#자동차들은 연비가 갤런당 17마일(median)을 중심으로 14마일에서 19마일 사이에 몰려 있다.