--[[
  Fancy Text Extension for Quarto

  이 확장 프로그램은 다양한 특수 텍스트와 정당 로고를 렌더링하는 숏코드를 제공합니다.

  포함된 숏코드:
  - 조판 시스템: latex, tex, bibtex, luatex, miktex, texlive, tinytex
  - 한글: han, han_svg
  - 특수 문자: ldots, vdots, ddots, pct, R2
  - 정당 로고: minjoo, people_power, nation, revolution

  모든 로고는 12pt(16px) 높이로 통일되어 본문 텍스트와 자연스럽게 정렬됩니다.
--]]

-- ============================================================================
-- 조판 시스템 (Typesetting Systems)
-- ============================================================================
-- LaTeX, TeX, BibTeX 등 조판 시스템 이름을 올바른 형식으로 렌더링합니다.

-- shortcode that provides a nicely formatted 'LaTeX' string
function latex()
  if quarto.doc.is_format("pdf") then
    return pandoc.RawBlock('tex', '{\\LaTeX}')
  elseif quarto.doc.is_format("html") then
    return pandoc.Math('InlineMath', "\\LaTeX")
  else
    return pandoc.Span('LaTeX')
  end
end

-- shortcode that provides a nicely formatted 'TeX' string
function tex()
  if quarto.doc.is_format("pdf") then
    return pandoc.RawBlock('tex', '{\\TeX}')
  elseif quarto.doc.is_format("html") then
    return pandoc.Math('InlineMath', "\\TeX")
  else
    return pandoc.Span('TeX')
  end
end

-- shortcode that provides a nicely formatted 'bibtex' string
function bibtex()
  if quarto.doc.is_format("pdf") then
    return pandoc.RawBlock('tex', '\\textsc{Bib}{\\TeX}')
  elseif quarto.doc.is_format("html") then
    return pandoc.RawBlock('html', '<span style="font-variant: small-caps;">Bib</span><span style="letter-spacing:-2px;">T</span><sub style="font-size: inherit; letter-spacing:-1px;">E</sub>X')
  else
    return pandoc.Span('BibTeX')
  end
end

-- shortcode that provides a nicely formatted 'LuaTeX' string
function luatex()
  if quarto.doc.is_format("pdf") then
    return pandoc.RawBlock('tex', '{\\LuaTeX}')
  elseif quarto.doc.is_format("html") then
    return pandoc.RawBlock('html', '<span style="font-variant: small-caps;">Lua</span><span style="letter-spacing:-2px;">T</span><sub style="font-size: inherit; letter-spacing:-1px;">E</sub>X')
  else
    return pandoc.Span('LuaTeX')
  end
end

-- shortcode that provides a nicely formatted 'MiKTeX' string
function miktex()
  if quarto.doc.is_format("pdf") then
    return pandoc.RawBlock('tex', '{MiK\\TeX}')
  elseif quarto.doc.is_format("html") then
    return pandoc.RawBlock('html', 'MiK<span style="letter-spacing:-2px;">T</span><sub style="font-size: inherit; letter-spacing:-1px;">E</sub>X')
  else
    return pandoc.Span('MiKTeX')
  end
end

-- shortcode that provides a nicely formatted 'TeX Live' string
function texlive()
  if quarto.doc.is_format("pdf") then
    return pandoc.RawBlock('tex', '{\\TeX} Live')
  elseif quarto.doc.is_format("html") then
    return pandoc.RawBlock('html', '<span style="letter-spacing:-2px;">T</span><sub style="font-size: inherit; letter-spacing:-1px;">E</sub>X Live')
  else
    return pandoc.Str('TeX Live')
  end
end

-- shortcode that provides a nicely formatted 'TinyTeX' string
function tinytex()
  if quarto.doc.is_format("pdf") then
    return pandoc.RawBlock('tex', '\\textbf{Tiny{\\TeX}}')
  elseif quarto.doc.is_format("html") then
    return pandoc.RawBlock('html', '<span style="font-weight: bold;">Tiny<span style="letter-spacing:-2px;">T</span><sub style="font-size: inherit; letter-spacing:-1px;">E</sub>X</span>')
  else
    return pandoc.Str('TinyTeX')
  end
end

-- ============================================================================
-- 한글 텍스트 (Korean Text)
-- ============================================================================
-- 옛한글 '한(ㅎㆍㄴ)' 글자를 유니코드 또는 SVG로 렌더링합니다.

-- '혼글' 로고를 SVG 이미지로 렌더링하는 숏코드
function hangul()
  if quarto.doc.is_format("html") then
    -- HTML: SVG 파일 내용을 직접 삽입
    local f = io.open("images/logo_hangul.svg", "r")
    if f then
      local content = f:read("*a")
      f:close()
      return pandoc.RawBlock('html', content)
    else
      return pandoc.Str("[logo_hangul.svg]")
    end
  elseif quarto.doc.is_format("pdf") then
    -- PDF: LaTeX \includegraphics 명령으로 SVG 삽입
    return pandoc.RawInline('latex', '\\includegraphics[height=12pt]{images/logo_hangul.svg}')
  else
    -- 기타 형식: 텍스트
    return pandoc.Str("한글")
  end
end

-- ============================================================================
-- 특수 문자 (Special Characters)
-- ============================================================================
-- 수학 기호, 줄임표 등 특수 문자를 생성합니다.

-- 수평 줄임표(…)를 생성하는 숏코드
function ldots()
  if quarto.doc.is_format("pdf") then
    return pandoc.RawBlock('tex', '\\ldots')
  elseif quarto.doc.is_format("html") then
    return pandoc.RawBlock('html', '&#8230;')
  else
    return "..."
  end
end

-- 수직 줄임표(⋮)를 생성하는 숏코드
function vdots()
  if quarto.doc.is_format("pdf") then
    return pandoc.Math('InlineMath', "\\vdots")
  elseif quarto.doc.is_format("html") then
    return pandoc.RawBlock('html', '&#8942;')
  else
    return "..."
  end
end

-- 대각선 줄임표(⋱)를 생성하는 숏코드
function ddots()
  if quarto.doc.is_format("pdf") then
    return pandoc.Math('InlineMath', "\\ddots")
  elseif quarto.doc.is_format("html") then
    return pandoc.RawBlock('html', '&#8945;')
  else
    return "..."
  end
end

-- 퍼센트 기호(%)를 생성하는 숏코드
function pct()
  if quarto.doc.is_format("pdf") then
    return pandoc.Math('InlineMath', '\\%')
  else
    return pandoc.Str("%")
  end
end

-- R² (R 제곱)을 생성하는 숏코드
function R2()
  if quarto.doc.is_format("pdf") then
    return pandoc.Math('InlineMath', "R^2")
  else
    return {pandoc.Str("R"), pandoc.Superscript("2")}
  end
end

-- ============================================================================
-- 정당 로고 (Political Party Logos)
-- ============================================================================
-- 한국 정당들의 로고를 SVG 이미지로 렌더링합니다.
-- 모든 로고는 높이 16px(12pt)로 통일되어 텍스트와 자연스럽게 정렬됩니다.
-- HTML 형식: SVG 파일 렌더링 | 기타 형식: 정당명 텍스트

-- 더불어민주당 로고를 표시하는 숏코드
-- 크기: 31.70 × 16px
function minjoo()
  if quarto.doc.is_format("html") then
    local f = io.open("images/logo_minjoo.svg", "r")
    if f then
      local content = f:read("*a")
      f:close()
      return pandoc.RawBlock('html', content)
    else
      return pandoc.Str("[logo_minjoo.svg]")
    end
  elseif quarto.doc.is_format("pdf") then
    return pandoc.RawInline('latex', '\\includegraphics[height=12pt]{images/logo_minjoo.svg}')
  else
    return pandoc.Str("더불어민주당")
  end
end

-- 국민의힘 로고를 표시하는 숏코드
-- 크기: 55.47 × 16px
function people_power()
  if quarto.doc.is_format("html") then
    local f = io.open("images/logo_people_power.svg", "r")
    if f then
      local content = f:read("*a")
      f:close()
      return pandoc.RawBlock('html', content)
    else
      return pandoc.Str("[logo_people_power.svg]")
    end
  elseif quarto.doc.is_format("pdf") then
    return pandoc.RawInline('latex', '\\includegraphics[height=12pt]{images/logo_people_power.svg}')
  else
    return pandoc.Str("국민의힘")
  end
end

-- 조국혁신당 로고를 표시하는 숏코드
-- 크기: 37.09 × 16px
function nation()
  if quarto.doc.is_format("html") then
    local f = io.open("images/logo_nation.svg", "r")
    if f then
      local content = f:read("*a")
      f:close()
      return pandoc.RawBlock('html', content)
    else
      return pandoc.Str("[logo_nation.svg]")
    end
  elseif quarto.doc.is_format("pdf") then
    return pandoc.RawInline('latex', '\\includegraphics[height=12pt]{images/logo_nation.svg}')
  else
    return pandoc.Str("조국혁신당")
  end
end

-- 개혁신당 로고를 표시하는 숏코드
-- 크기: 40.93 × 16px
function revolution()
  if quarto.doc.is_format("html") then
    local f = io.open("images/logo_revolution.svg", "r")
    if f then
      local content = f:read("*a")
      f:close()
      return pandoc.RawBlock('html', content)
    else
      return pandoc.Str("[logo_revolution.svg]")
    end
  elseif quarto.doc.is_format("pdf") then
    return pandoc.RawInline('latex', '\\includegraphics[height=12pt]{images/logo_revolution.svg}')
  else
    return pandoc.Str("개혁신당")
  end
end
