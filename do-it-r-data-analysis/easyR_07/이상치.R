mpg <- as.data.frame(ggplot2::mpg)
mpg[c(10, 14, 58, 93), "drv"] <- "k"
mpg[c(29, 43, 129, 203), "cty"] <- c(3, 4, 39, 42)

#drv에 이상치가 있는지 확인. 이상치를 결측 처리한 후 이상치가 사라졌는지 확인.
table(mpg$drv)
mpg$drv <- ifelse(mpg$drv %in% c("4", "f", "r"), mpg$drv, NA)
table(mpg$drv)

#상자 그림을 이용해 cty에 이상치가 있는지 확인. 통계치를 이용해 정상 범위를 벗어난 값 결측 처리 후 이상치가 사라졌는지 확인.
