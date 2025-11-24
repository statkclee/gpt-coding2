# CLAUDE.md - 챗GPT 코딩 개정판 프로젝트

## 프로젝트 개요

이 프로젝트는 **"챗GPT 코딩: 인공지능(LLM)과 동료(Git/GitHub)와 함께 하는 프로그래밍"** 개정판의 소스 코드입니다. [Quarto](https://quarto.org/) 출판 시스템을 사용하여 제작되는 기술 서적입니다.

### 출판 전략: HTML 우선, PDF 대비

**HTML 우선 출판**
- 웹 출판 (`docs/` 디렉토리)을 우선으로 개발
- 인터랙티브 기능 활용 (WebR, Pyodide)
- GitHub Pages를 통한 즉각적인 배포

**PDF 출판 대비 전략**
- 모든 시각 자료를 **grayscale Tufte style SVG**로 제작
- 중복 작업 방지: HTML/PDF 양쪽에서 동일한 이미지 사용
- LaTeX 컴파일 호환성 확보
- 인쇄 시 토너 절약 및 최적 가독성

### 핵심 디자인 원칙: Tufte Style

Edward Tufte의 정보 디자인 원칙을 따라 모든 다이어그램 제작:

1. **Grayscale Only** - 흑백 계열만 사용 (#333, #666, #999)
2. **High Data-Ink Ratio** - 불필요한 장식 최소화, 정보 전달에 집중
3. **Serif Typography** - Palatino, Georgia 계열 가독성 높은 서체
4. **Clear Visual Hierarchy** - 명확한 계층 구조와 여백 활용
5. **Minimal Decoration** - 단순하고 깔끔한 선과 도형

**이점:**
- HTML 렌더링: 깔끔하고 전문적인 느낌
- PDF 변환: 별도 수정 없이 고품질 출력
- 인쇄: 흑백 인쇄 시 품질 저하 없음
- 일관성: 전체 책의 시각적 통일성 확보

## 기술 스택

### 콘텐츠 제작
- **포맷**: Quarto Markdown (`.qmd`)
- **언어**: R, Python (dual-language approach)
- **출판**: HTML (현재), PDF (준비 중)

### 개발 환경
- **버전 관리**: Git/GitHub
- **렌더링**: Quarto 1.4+
- **의존성**:
  - R 패키지: `renv.lock` (renv 관리)
  - Python 패키지: `requirements.txt`

### Quarto Extensions

```yaml
filters:
  - fontawesome        # 아이콘
  - include-code-files # 외부 코드 포함
  - fancy-text         # 커스텀 숏코드
  - webr               # 브라우저 내 R 실행
  - pyodide            # 브라우저 내 Python 실행
```

## 책 구조

### 현재 작업 중: 5부 - 통합 개발 환경

**활성화된 챕터:**
- `ide.qmd` - IDE 선택의 여정: 역사부터 미래까지
- `ide_positron.qmd` - Positron: R과 Python을 위한 차세대 IDE
- `ide_extension.qmd` - IDE 확장 프로그램: 필요성과 아키텍처
- `ide_setup.qmd` - 개발 환경 구축
- `shortcode.qmd` - 숏코드 테스트

**주요 다이어그램 (Tufte style SVG):**
- `images/ide-architecture-overview.svg` - VS Code 기반 IDE 전체 아키텍처
- `images/ide-kernel-architecture.svg` - 커널 아키텍처 (프론트엔드-커널 통신)
- `images/ide-extension-host.svg` - Extension Host 격리 구조
- `images/ide-lsp-architecture.svg` - 언어 서버 프로토콜 (LSP)

### 향후 작업 예정 (주석 처리됨)

**1부: 프로그래밍**
- 프로그래밍 기초, 변수, 제어문, 함수, 반복문
- 파일: `01-intro.qmd` ~ `05-loop.qmd`

**2부: 자료구조**
- 문자열, 파일, 리스트, 딕셔너리, 튜플, 데이터프레임
- 파일: `06-string.qmd` ~ `A-dataframe.qmd`

**3부: 버전제어와 협업**
- Git 기초부터 협업, GitHub, 충돌 해결까지
- 파일: `git-basics.qmd` ~ `git-ide.qmd`

**4부: 분야별 코딩**
- 정규표현식, 네트워크, 웹, 데이터베이스, Make, 시각화, GPT
- 파일: `tool-regex.qmd` ~ `tool-gpt.qmd`

## 빌드 및 개발

### 로컬 미리보기

```bash
quarto preview
```

포트 7771에서 브라우저 미리보기 제공 (`_quarto.yml` 설정)

### 전체 렌더링

```bash
quarto render
```

출력: `docs/` 디렉토리 (GitHub Pages 배포용)

### 의존성 복원

**R 패키지:**
```R
renv::restore()
```

**Python 패키지:**
```bash
pip install -r requirements.txt
```

## 프로젝트 디렉토리 구조

```
gpt-coding2/
├── _quarto.yml           # Quarto 설정
├── index.qmd             # 서문 및 시작 페이지
├── [01-10]-*.qmd        # 1-2부 챕터 (주석)
├── git-*.qmd            # 3부 Git 챕터 (주석)
├── tool-*.qmd           # 4부 도구 챕터 (주석)
├── ide*.qmd             # 5부 IDE 챕터 (활성)
├── images/              # SVG 다이어그램 (Tufte style)
├── code/                # R/Python 예제 코드
├── data/                # 데이터셋
├── docs/                # HTML 출력 (GitHub Pages)
└── _extensions/         # Quarto 확장 프로그램
```

## 작업 가이드

### 이미지 생성 규칙

**모든 다이어그램은 반드시 Tufte style grayscale SVG로 제작:**

```svg
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 WIDTH HEIGHT">
  <defs>
    <style>
      .tufte-text {
        font-family: Palatino, 'Book Antiqua', Georgia, serif;
        fill: #333;
      }
      /* Grayscale only: #333, #666, #999, #ccc, #f5f5f5 */
    </style>
  </defs>

  <!-- White background -->
  <rect x="0" y="0" width="WIDTH" height="HEIGHT" fill="#ffffff"/>

  <!-- Content here -->
</svg>
```

**이유:**
- HTML과 PDF 양쪽에서 일관된 품질
- 색상 이미지 재작업 불필요
- LaTeX SVG 처리 오류 방지
- 인쇄 비용 절감

### 챕터 추가 시

1. `_quarto.yml`에서 해당 파트 주석 해제
2. `.qmd` 파일 작성/수정
3. 이미지 필요 시 `images/` 폴더에 Tufte style SVG 생성
4. `quarto preview`로 렌더링 확인
5. Git 커밋 전 빌드 오류 확인

### Git 워크플로우

```bash
# 변경사항 확인
git status

# 렌더링 테스트
quarto render

# 커밋
git add .
git commit -m "작업 내용"
git push
```

## 현재 이슈 및 해결 사항

### ✅ 해결됨: Shinylive Service Worker 404

**문제:** `quarto preview` 실행 시 `/shinylive-sw.js` 404 오류
**원인:** WebR/Pyodide 필터 사용 시 브라우저 캐시 문제
**해결:** 캐시 삭제, 시크릿 모드 사용 (실제 기능에는 영향 없음)

### ✅ 해결됨: Typst 지원 문제

**문제:** Quarto book 프로젝트가 Typst 출력 형식 미지원
**해결:** PDF 필요 시 LaTeX 사용 (주석 처리된 설정 참고)

### ✅ 해결됨: SVG 이미지 LaTeX 호환성

**문제:** `shortcode.qmd`의 SVG 로고가 PDF 렌더링 오류 발생
**해결:** PDF 출력 시 해당 챕터 제외 또는 Inkscape 설치 필요

### ✅ 해결됨: Mermaid 다이어그램 버그

**문제:** 정의되지 않은 노드(`KernelLayer`) 사용으로 렌더링 오류
**해결:** Tufte style SVG로 완전히 교체

## 저장소 정보

- **GitHub**: https://github.com/bit2r/gpt-coding/
- **웹사이트**: https://r2bit.com/gpt-coding/
- **저자**: 이광춘 (Openai)
- **소속**: 공익법인 한국 R 사용자회

## AI 어시스턴트 작업 시 주의사항

Claude Code 또는 다른 AI 도구로 작업할 때:

1. **이미지 생성**: 반드시 Tufte style grayscale SVG로 제작
2. **새 챕터 추가**: `_quarto.yml`의 해당 파트 주석 해제 후 작업
3. **렌더링 테스트 필수**: 커밋 전 `quarto render`로 오류 확인
4. **한글 처리**: 파일명, 경로에 한글 사용 시 주의 (인코딩 UTF-8)
5. **PDF 준비**: 이미지는 항상 grayscale, SVG 또는 고해상도 PNG
6. **커밋 메시지**: 명확하고 구체적인 변경 내용 기록
7. **문체 준수**: 아래 문체 가이드 엄격히 준수

## 문체 가이드

### 평서문 원칙

**기본 원칙**: 서문(index.qmd)과 에필로그(epilogue.qmd) 제외한 모든 qmd 파일은 평서문으로 작성

**평서문 스타일**:
- "~합니다" → "~한다" / "~함"
- "~입니다" → "~이다" / "~임"
- "~할 수 있습니다" → "~할 수 있다"
- "~하고자 합니다" → "~한다"

**예외 (존칭 유지)**:
- `index.qmd`: 서문 - 독자에게 존칭 사용
- `epilogue.qmd`: 에필로그 - 독자에게 존칭 사용

### AI 티 제거 필수

**제거할 AI 특성 표현**:

1. **과도한 지시 대명사**:
   - ❌ "이러한 방식은"
   - ✅ "해당 방식은" 또는 직접 명시

2. **불필요한 관형사형**:
   - ❌ "~하는 것입니다"
   - ✅ "~한다"

3. **기계적 연결어**:
   - ❌ "다음으로,", "또한,", "마지막으로,"
   - ✅ "이와 함께", "한 걸음 더 나아가", "결론적으로"

4. **과도한 격식**:
   - ❌ "본 연구에서는 ~에 대하여 고찰하고자 한다"
   - ✅ "~를 살펴본다"

**자연스러운 문장 작성**:
- 짧고 명확한 문장
- 능동태 우선 사용
- 불필요한 수식어 제거
- 직접적이고 구체적인 서술

## 최근 작업 이력

- SVG 다이어그램 4개 생성 (Tufte style grayscale)
- IDE 아키텍처 챕터 작성 완료
- HTML 출력 설정 확정 (PDF 설정은 주석 처리)
- GitHub Pages 배포 구조 확립
- Mermaid 다이어그램 → SVG 변환 완료

## 다음 단계

1. 나머지 부(1-4부) 챕터 활성화 및 검토
2. 기존 이미지들을 Tufte style SVG로 변환
3. PDF 출판 설정 최종 테스트
4. 전체 책 일관성 검토


# 교정 및 검증 작업

## 편집 및 품질 관리 가이드라인

책의 전문성과 가독성을 높이기 위해 다음 교정 및 검증 작업을 수행해야 합니다.

### 1. Section Label 체계 (sec- 접두사)

**모든 H1, H2 제목에 고유한 section label을 부여**하여 상호 참조를 가능하게 합니다.

#### 명명 규칙:
```markdown
# 제목 {#sec-챕터명-주제}

## 하위 제목 {#sec-챕터명-세부주제}
```

#### 예시:
```markdown
# 문서 코드화의 위기 {#sec-crisis-intro}

## HWP/DOCX의 한계 {#sec-crisis-hwp-limits}

## 재현가능성 부재 {#sec-crisis-reproducibility}
```

#### 챕터별 접두사 표준:
- `doc_paradigm_crisis.qmd` → `sec-crisis-*`
- `doc_paradigm_shift.qmd` → `sec-shift-*`
- `doc_reproducible.qmd` → `sec-repro-*`
- `doc_ai_integration.qmd` → `sec-ai-*`
- `part_components.qmd` → `sec-comp-*`
- `part_fonts.qmd` → `sec-fonts-*`
- `part_markdown.qmd` → `sec-md-*`
- `part_languages.qmd` → `sec-lang-*`
- `part_scientific_dsl.qmd` → `sec-dsl-*`
- `ai_workflow.qmd` → `sec-wf-*`
- `ai_quarto.qmd` → `sec-quarto-*`
- `ai_creative_writing.qmd` → `sec-write-*`

#### 중복 방지 원칙:
- 챕터 이름을 접두사에 포함하여 전역적으로 고유성 보장
- 예: `sec-crisis-intro`, `sec-shift-intro` (둘 다 intro이지만 챕터 접두사로 구분)

#### 상호 참조 예시:
```markdown
@sec-crisis-intro 에서 다룬 바와 같이, ...

자세한 내용은 @sec-dsl-ggplot2 를 참조하세요.
```

### 2. 영어 용어 병기 규칙

**첫 등장 시에만 한글(영어) 형식으로 병기**하고, 이후에는 한글만 사용합니다.

#### 병기 원칙:
- **첫 등장**: 한글(영어) 형식으로 병기하고 색인 추가
- **재등장**: 한글만 사용
- **일관성**: 동일한 용어는 동일한 한글 표기 사용

#### 주요 용어 예시:
```markdown
# 첫 등장 (병기 + 색인)
R 마크다운(R Markdown) \index{R 마크다운}
주피터 노트북(Jupyter Notebook) \index{주피터 노트북}
쿼토(Quarto) \index{쿼토}
레이텍(LaTeX) \index{레이텍}
챗GPT(ChatGPT) \index{챗GPT}
knitr(니트) \index{knitr}

# 이후 등장 (한글만)
R 마크다운의 등장은...
주피터는 Python에...
쿼토에서 분석을...
레이텍 기반이라...
챗GPT와 함께...
니트는 HTML 출력을...
```

#### 적용 범위:
- 본문 내용
- 제목 및 소제목
- 표와 그림 설명
- 코드 블록 주석
- 색인 항목

#### 예외 사항:
- **기술 용어 그대로**: ggplot2, Git, HTML, PDF, YAML 등은 원어 사용
- **브랜드명**: GitHub, VS Code, RStudio 등은 원어 사용
- **약어**: API, AI, URL, JSON 등은 원어 사용

#### 인명 표기 규칙:
- **첫 등장**: 한글(영어) 형식으로 병기
- **재등장**: 한글만 사용
- **예시**:
  ```markdown
  # 첫 등장
  존 맥파레인(John MacFarlane)이 2006년 만든...
  페르난도 페레스(Fernando Pérez)가 2014년 시작한...
  이휘재(Yihui Xie)가 2012년 만든...

  # 이후 등장
  맥파레인은...
  페레스는...
  이휘재는...
  ```
- **저명 인물**: 도널드 크누스(Donald Knuth), 존 그루버(John Gruber) 등
- **한국인 이름**: 이광춘, 김교수 등은 한글만 사용

### 3. 오탈자 및 윤문

#### 검증 항목:
- **맞춤법 검사**: 한국어 맞춤법 및 띄어쓰기
- **용어 통일**:
  - "문서 코드화" vs "문서의 코드화" → "문서 코드화" 통일
  - "재현가능" vs "재현 가능" → "재현가능" 통일 (학술 용어)
  - 영어 용어는 첫 등장 시에만 병기, 이후 한글만 사용
- **문맥 자연스러움**:
  - 문장 간 논리적 연결 강화
  - 불필요한 반복 제거
  - 단락 전환 부드럽게

#### 윤문 예시:
```markdown
# Before (부자연스러움)
문서 코드화는 중요하다. 왜냐하면 재현가능성이 필요하기 때문이다.
그래서 우리는 쿼토를 사용한다.

# After (자연스러움)
문서 코드화가 중요한 이유는 재현가능성 확보에 있다. 이를 실현하는
대표적인 도구가 바로 쿼토이다.
```

### 4. AI 작성 티 제거 (Human-like Writing)

AI가 생성한 텍스트의 특징을 제거하고 인간 저자의 목소리를 강화합니다.

#### 피해야 할 AI 특유의 패턴:

**❌ 과도한 나열:**
```markdown
이 기술은:
1. 효율적입니다
2. 강력합니다
3. 확장 가능합니다
4. 사용하기 쉽습니다
```

**✅ 자연스러운 서술:**
```markdown
제시된 기술은 효율성과 강력함을 갖추면서도 확장 가능하고
사용하기 쉽다는 장점이 있다.
```

**❌ 기계적 전환 문구:**
- "다음으로, ..."
- "또한, ..."
- "마지막으로, ..."

**✅ 자연스러운 전환:**
- "이와 함께 고려할 점은..."
- "한 걸음 더 나아가..."
- "결론적으로..."

**❌ 과도한 격식:**
```markdown
본 연구에서는 쿼토 시스템의 효용성에 대하여 고찰하고자 한다.
```

**✅ 적절한 격식:**
```markdown
쿼토가 과학기술 글쓰기에 얼마나 유용한지 살펴보자.
```

#### 인간적 목소리 강화 기법:

1. **개인 경험 삽입:**
```markdown
필자도 처음 HWP에서 쿼토로 전환할 때 많은 시행착오를 겪었다.
```

2. **직접적인 독자 호명:**
```markdown
여러분이 만약 복잡한 수식이 포함된 논문을 쓴다면...
```

3. **실제 사례 언급:**
```markdown
2023년 한 연구팀은 쿼토를 활용하여 100페이지 분량의
기술 보고서를 3일 만에 완성했다.
```

4. **감정과 태도 표현:**
```markdown
제시된 기능은 정말 놀랍다. 단 몇 줄의 코드로...
```

### 5. 색인(Index) 추가

**중요한 개념, 기술, 도구에 색인을 추가**하여 독자의 정보 접근성을 높입니다.

#### 색인 추가 원칙:

**주요 개념 (첫 등장 시 색인 추가):**
```markdown
\index{문서 코드화}문서 코드화는 문서를 소프트웨어처럼...

\index{재현가능성}재현가능성이란 동일한 데이터와...

\index{bitPublish}bitPublish 확장은 한글 PDF 출판을...
```

**기술 용어 (중요 문맥에서 추가):**
```markdown
\index{Quarto!설치}쿼토를 설치하려면...

\index{LaTeX!XeLaTeX}XeLaTeX 엔진은 한글 폰트를...

\index{git!버전 관리}Git을 활용한 버전 관리는...
```

**도구 및 패키지:**
```markdown
\index{ggplot2}ggplot2는 데이터 시각화의...

\index{gt!한글 테이블}gt 패키지로 한글 테이블을...

\index{systemfonts}systemfonts 패키지는...
```

#### 계층적 색인 (하위 항목):**
```markdown
\index{Quarto!렌더링}
\index{Quarto!프로젝트 구조}
\index{Quarto!확장 기능}

\index{한글!폰트}
\index{한글!타이포그래피}
\index{한글!맞춤법}
```

#### 색인 빈도 가이드:
- **핵심 개념**: 챕터당 5-10개
- **기술 용어**: 챕터당 10-15개
- **도구/패키지**: 첫 등장 시 + 중요 사용 예시마다
- **과도한 색인 지양**: 모든 단어에 색인을 달지 말 것

#### 색인 배치 예시:
```markdown
# 문서 코드화의 필요성 {#sec-crisis-need}

\index{문서 코드화}문서 코드화(Document as Code)는 전통적인
워드프로세서 방식과 근본적으로 다른 접근법이다. \index{버전 관리}
버전 관리 시스템인 \index{Git}Git과 결합하면, 문서의 모든 변경
이력을 추적할 수 있다.

\index{재현가능성}재현가능성은 과학 연구의 핵심이다.
\index{Quarto}쿼토는 \index{데이터 분석}데이터 분석과
\index{문서 작성}문서 작성을 하나의 워크플로우로 통합한다.
```

### 6. 교정 체크리스트

각 챕터를 완성한 후 다음 체크리스트를 확인하세요:

- [ ] 모든 H1, H2 제목에 `{#sec-*}` label 추가
- [ ] Section label 중복 검사 완료
- [ ] 영어 용어 병기 규칙 적용 (첫 등장 시에만 한글(영어))
- [ ] 맞춤법 및 띄어쓰기 검증
- [ ] 용어 통일성 확인
- [ ] AI 특유의 문체 제거 (기계적 나열, 과도한 격식 등)
- [ ] 자연스러운 문맥 전환 확인
- [ ] 핵심 개념에 색인 추가 (5-10개/챕터)
- [ ] 기술 용어 색인 추가 (10-15개/챕터)
- [ ] 계층적 색인 적절히 활용
- [ ] 실제 사례/경험 언급 여부
- [ ] 독자 호명 및 감정 표현 포함 여부

### 7. 작업 워크플로우

```bash
# 1. 챕터 초안 작성
# (AI 또는 직접 작성)

# 2. Section label 추가
# 모든 제목에 {#sec-챕터명-주제} 형식으로 추가

# 3. 오탈자 및 윤문
# 맞춤법 검사, 용어 통일, 문맥 자연스럽게

# 4. AI 티 제거
# 기계적 패턴 제거, 인간적 목소리 강화

# 5. 색인 추가
# \index{키워드} 형식으로 중요 개념마다 추가

# 6. 최종 검토
# 체크리스트 확인 후 커밋
git add chapter_name.qmd
git commit -m "교정: chapter_name 최종 검토 완료"

# 7. 렌더링 테스트
quarto render --to bitPublish-pdf
```

### 8. 예시: 교정 전후 비교

#### 교정 전:
```markdown
# 문서 코드화의 소개

문서 코드화는 중요합니다. 왜냐하면:
1. 재현가능합니다
2. 버전 관리가 됩니다
3. 협업이 쉽습니다

다음으로, 쿼토에 대해 알아보겠습니다.
```

#### 교정 후:
```markdown
# 문서 코드화의 필요성 {#sec-crisis-need}

\index{문서 코드화}문서 코드화가 주목받는 이유는 명확하다.
\index{재현가능성}재현가능성을 확보하면서도 \index{Git!버전 관리}
체계적인 버전 관리가 가능하고, 여러 명이 동시에 작업할 수 있기
때문이다. 필자가 처음 이 방식을 접했을 때도 비슷한 감동을 받았다.

이러한 장점을 구현하는 대표적인 도구가 바로 \index{Quarto}쿼토이다.
```

**개선 사항:**
- ✅ Section label 추가: `{#sec-crisis-need}`
- ✅ 나열 방식 제거 → 자연스러운 서술
- ✅ 색인 추가: 4개 (`문서 코드화`, `재현가능성`, `Git!버전 관리`, `Quarto`)
- ✅ 개인 경험 언급: "필자가 처음 이 방식을 접했을 때..."
- ✅ 부드러운 전환: "이러한 장점을 구현하는..."

