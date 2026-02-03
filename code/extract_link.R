library(stringr)

cat("웹사이트 입력 - ")
url <- readLines(file("stdin"), 1)

html <- readLines(url, warn = FALSE)
html <- paste(html, collapse = "\n")

links <- str_extract_all(html, 'href="http://[^"]*"')[[1]]
links <- str_replace_all(links, 'href="', '')

print(links)
