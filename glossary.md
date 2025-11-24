# 한글화 용어 사전 (Glossary)

이 프로젝트에서 사용하는 영어 기술 용어의 한글 표기 기준입니다.

## 원칙

1. **첫 등장**: 한글(영어) 형식으로 병기
2. **재등장**: 한글만 사용
3. **색인 추가**: 첫 등장 시 `\index{한글}` 추가

---

## 운영체제 및 플랫폼

| 영어 | 한글 | 첫 등장 표기 | 비고 |
|------|------|--------------|------|
| Docker | 도커 | 도커(Docker) | 컨테이너 플랫폼 |
| Python | 파이썬 | 파이썬(Python) | 프로그래밍 언어 |
| Windows | 윈도우 | 윈도우(Windows) | 운영체제 |
| macOS | 맥OS | 맥OS(macOS) | 운영체제 |
| Linux | 리눅스 | 리눅스(Linux) | 운영체제 |
| Ubuntu | 우분투 | 우분투(Ubuntu) | 리눅스 배포판 |
| Debian | 데비안 | 데비안(Debian) | 리눅스 배포판 |
| Rust | 러스트 | 러스트(Rust) | 프로그래밍 언어 |
| PowerShell | 파워셸 | 파워셸(PowerShell) | 명령줄 셸 |
| Anaconda | 아나콘다 | 아나콘다(Anaconda) | 파이썬 배포판 |

---

## 문서 작성 도구

| 영어 | 한글 | 첫 등장 표기 | 비고 |
|------|------|--------------|------|
| Quarto | 쿼토 | 쿼토(Quarto) | 문학적 프로그래밍 |
| Pandoc | 판독 | 판독(Pandoc) | 문서 변환 엔진 |
| TinyTeX | 타이니텍 | 타이니텍(TinyTeX) | LaTeX 배포판 |
| MiKTeX | - | {{< miktex >}} | LaTeX 배포판 (shortcode) |
| TeX Live | - | {{< texlive >}} | LaTeX 배포판 (shortcode) |
| LaTeX | - | {{< latex >}} | 조판 시스템 (shortcode) |

---

## 글꼴

| 영어 | 한글 | 첫 등장 표기 | 비고 |
|------|------|--------------|------|
| Pretendard | 프리텐다드 | 프리텐다드(Pretendard) | 가변 웹 폰트 |
| D2Coding | D2코딩 | D2코딩(D2Coding) | 코딩 전용 폰트 |

---

## 원어 유지 (한글화 안함)

### 브랜드명
- Git, GitHub, VS Code, RStudio, Positron, Xcode, Chocolatey

### 약어
- IDE, AI, CI/CD, PDF, HTML, SQL, CSV, OS, CLI, API, JSON, YAML

### 기술 용어/패키지명
- pip, venv, make, pandas, numpy, scikit-learn, TensorFlow, PyTorch
- ggplot2, dplyr, tinytex, gt, renv, rig, uv
- CRAN

---

## 추가 규칙

### 명령어/파일명
- 원어 유지: `python`, `docker`, `make`, `requirements.txt`, `Dockerfile`

### URL/경로
- 원어 유지: `python.org`, `docker.com`

### 혼합 표기 허용
- "윈도우 PowerShell"
- "파이썬 패키지"
- "도커 컨테이너"

---

## 업데이트 이력

- 2025-11-24: 초기 생성 (15개 용어)
  - 운영체제: 도커, 파이썬, 윈도우, 맥OS, 리눅스, 우분투, 데비안
  - 도구: 러스트, 파워셸, 아나콘다
  - 문서: 쿼토, 판독, 타이니텍
  - 글꼴: 프리텐다드
