#!/usr/bin/env Rscript

args = commandArgs(trailingOnly=TRUE)
country <- args[1]

# country <- "data/austria.csv"

# 데이터 불러오기
gdp_df <- read.csv(country, sep=",", head=TRUE)
# 평균계산
gdp_mean <- mean(gdp_df$gdp)
# 국가명 출력
country_name <- sub("data/(.*)\\.csv", "\\1", country)
# 계산결과 화면출력
cat("국가명:", country_name, " 평균: ", gdp_mean, "\n")
