# grade_dashboard.py - Streamlit 학생 성적 대시보드
# 실행: streamlit run grade_dashboard.py
import streamlit as st
import pandas as pd
import altair as alt

st.title("학생 성적 대시보드")

# 입력: 슬라이더로 3명의 점수 조정
col1, col2, col3 = st.columns(3)
with col1:
    score_kim = st.slider("김철수", 0, 100, 85)
with col2:
    score_lee = st.slider("이영희", 0, 100, 92)
with col3:
    score_park = st.slider("박지민", 0, 100, 78)

scores = {"김철수": score_kim, "이영희": score_lee, "박지민": score_park}

# 출력 1: 통계 (슬라이더 변경 시 자동 갱신)
mean_score = sum(scores.values()) / len(scores)
st.metric("평균", f"{mean_score:.1f}점")
st.write(f"최고: {max(scores.values())}점 | 최저: {min(scores.values())}점")

# 출력 2: 등급 분포 (슬라이더 변경 시 자동 갱신)
grades = {"A": 0, "B": 0, "C": 0}
for s in scores.values():
    if s >= 90: grades["A"] += 1
    elif s >= 80: grades["B"] += 1
    else: grades["C"] += 1

# Altair 차트: 정수 y축
df = pd.DataFrame({"등급": list(grades.keys()), "학생 수": list(grades.values())})
chart = alt.Chart(df).mark_bar().encode(
    x=alt.X("등급:N", sort=["A", "B", "C"]),
    y=alt.Y("학생 수:Q", axis=alt.Axis(tickMinStep=1), scale=alt.Scale(domain=[0, 3]))
).properties(height=300)
st.altair_chart(chart, use_container_width=True)
