
import pandas as pd
import numpy as np

df = pd.read_csv("./20240118163600_광역별 방문자 수.csv" ,encoding="cp949")

df
df['광역지자체 방문자 수'] = df['광역지자체 방문자 수'].astype(int)
df['기초지자체 방문자 수'] = df['기초지자체 방문자 수'].astype(int)
df
df[df['광역지자체명']=='강원특별자치도'].sort_values('기초지자체 방문자 수', ascending=False)
df[df['광역지자체명']=='광주광역시'].sort_values('기초지자체 방문자 수', ascending=False)
df[df['광역지자체명']=='제주특별자치도'].sort_values('기초지자체 방문자 수', ascending=False)

grouped_df = df.groupby('광역지자체명')[['광역지자체 방문자 수', '기초지자체 방문자 수']].sum().reset_index()

# 결과 확인
grouped_df.sort_values('광역지자체 방문자 수', ascending=False).reset_index()
df['시군구'] = df['기초지자체명'].apply(lambda x: x.split()[-1])

# 필요한 열만 선택
result_df = df[['광역지자체명', '시군구', '광역지자체 방문자 수', '광역지자체 방문자 비율', '기초지자체 방문자 수', '기초지자체 방문자 비율']]

# 결과 확인
result_df
result_df['시군구'].unique

# 광역지자체별 총 방문자 수 계산
df['광역지자체별 총 방문자 수'] = df.groupby('광역지자체명')['기초지자체 방문자 수'].transform('sum')

# 각 기초지자체의 방문자 수를 광역지자체별 총 방문자 수로 나누어 백분율 계산
df['기초지자체 방문자 비율'] = (df['기초지자체 방문자 수'] / df['광역지자체별 총 방문자 수']) * 100

# 결과 확인
df


# 전체 방문자 수 합계 계산
total_visitors = df['광역지자체 방문자 수'].sum()

# 각 지자체의 방문자 수를 전체 합계로 나누고 100을 곱하여 백분율 계산
df['방문자수 백분율'] = (df['광역지자체 방문자 수'].groupby('광역지자체명') / total_visitors) * 100

df.sort_values('방문자수 백분율', ascending=False)
grouped_df = df.groupby('광역지자체명').aggregate({'광역지자체 방문자 수': 'sum'})
sorted_df = grouped_df.sort_values(by='광역지자체 방문자 수', ascending=False)
sorted_df
df['광역지자체명'].unique()
df['광역지자체명'].value_counts



culture = pd.read_csv("./20240119142404_지역별 관광지 검색순위.csv" , encoding="cp949" )
culture = culture.set_index('순위')
culture.head(7)
df4 = pd.read_csv("./20240119142717_지역별 관광지 검색순위.csv", encoding="cp949")
df4.head(10)



