# romeo_count.R --------------

cat("파일명을 입력하세요: ")
fname <- readLines(con = "stdin", n = 1)

fhand <- tryCatch({
  romeo_text <- readLines(fname)
}, error = function(e) {
  message("파일을 열 수 없습니다:", fname)
  quit(save = "no", status = 1)
})

romeo_split <- stringr::str_split(romeo_text, " ")

romeo_freq <- romeo_split |> unlist() |> 
  table() |>
  unlist()

romeo_freq

