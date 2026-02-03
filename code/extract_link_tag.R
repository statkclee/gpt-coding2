library(httr)
library(rvest)

cat("웹사이트 입력 - ")
url <- readLines(file("stdin"), 1)

response <- GET(url)
html_content <- content(response, "text", encoding = "UTF-8")

html <- read_html(html_content)
tags <- html_nodes(html, "a")

for (tag in tags) {
  # Tag
  cat("TAG:", toString(xml2::xml_find_first(tag, xpath = ".")), "\n")
  
  # URL
  url <- html_attr(tag, "href")
  cat("URL:", url, "\n")
  
  # Content
  content <- html_text(tag)
  cat("Content:", content, "\n")
  
  # Attributes
  attrs <- html_attrs(tag)
  cat("Attrs:", paste(names(attrs), attrs, sep=": ", collapse=", "), "\n\n")
}

