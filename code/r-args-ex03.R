#!/usr/bin/env Rscript

args = commandArgs(trailingOnly=TRUE)
action = args[1]
country <- args[-1]

# 데이터 불러오기
gdp_df <- read.csv(country, sep=",", head=TRUE)

# 국가명 추출
country_name <- sub("data/(.*)\\.csv", "\\1", country)

# 기초 통계량 계산
if(action == "--min") {
  gdp_min <- min(gdp_df$gdp)
  cat("국가명:", country_name, " 최소: ", gdp_min, "\n")  
}else if(action == "--mean") {
  gdp_mean <- mean(gdp_df$gdp)
  cat("국가명:", country_name, " 평균: ", gdp_mean, "\n")  
}else if (action=="--max"){
  gdp_max <- max(gdp_df$gdp)
  cat("국가명:", country_name, " 최대: ", gdp_max, "\n")  
}
