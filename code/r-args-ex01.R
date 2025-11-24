#!/usr/bin/env Rscript

gdp.df <- read.csv("data/austria.csv", sep=",", head=TRUE)
# 평균계산
gdp.mean <- mean(gdp.df$gdp, na.rm = TRUE)
# 계산결과 화면출력
cat("평균: ", gdp.mean, "\n")
