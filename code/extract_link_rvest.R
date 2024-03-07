library(httr)
library(xml2)
library(rvest)


cat("웹사이트 입력 - ")
url <- readLines(file("stdin"), 1)

html_content <- read_html(GET(url))

hrefs <- html_nodes(html_content, "a") |> 
  html_attr("href")

print(hrefs)
