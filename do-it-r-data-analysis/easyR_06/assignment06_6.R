# 연료와 가격으로 구성된 데이터 프레임 만들기
fuel <- data.frame(fl = c("c", "d", "e", "p", "r"),
                   price_fl = c(2.35, 2.38, 2.11, 2.76, 2.22),
                   stringAsFactors = F) # 문자를 factor 타입으로 변환하지 않도록 설정하는 파라미터. data.frame()은 변수에 문자가 들어 있으면 factor 타입으로 변환하도록 설정되어 있다. fuel 데이터의 문자 변수 fl을 mpg 데이터와 동일하게 문자 타입(chr)으로 만들어야 오류가 발생하지 않는다.
fuel

# mpg데이터에 연료 가격 변수 추가하기
mpg_new <- left_join(mpg, fuel, by = "fl")


# model, fl, price_fl 변수를 추출해 앞부분 5행 출력하기
mpg_new %>% 
  select(model, fl, price_fl) %>% 
  head(5)
