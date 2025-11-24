library(httr)
library(jsonlite)

# api_address.R 
cat("주소를 입력하세요 - ")
address <- readLines(file("stdin", encoding = "utf-8"), 1) 

# address <- "서울특별시 강남구 역삼동 737"

# HTTP 요청을 실행합니다.
address_res <-
  GET(url = 'https://dapi.kakao.com/v2/local/search/address.json',
      query = list(query = address),
      add_headers(Authorization = paste0("KakaoAK ",
                                        Sys.getenv("KAKAO_MAP_API_KEY"))) )

# 지리정보 데이터프레임 변환
address_list <- address_res |>
  content(as = 'text') |>
  fromJSON()

## 도로명주소
address_list$documents$road_address |>
  select(주소 = address_name, 경도 = x, 위도=y)

