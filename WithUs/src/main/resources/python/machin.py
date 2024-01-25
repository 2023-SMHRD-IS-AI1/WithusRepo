import pandas as pd
# X_train, X_test
df=pd.read_excel('./최종최종.xlsx')
df2=pd.read_excel('./y데이터4.xlsx')
df
df2
df.info()
X_train=df.iloc[:,0:5]
X_train
X_test=df2.iloc[:,0:5]
X_test
y_train=df.iloc[:,5:]
y_train
X_train=pd.get_dummies(X_train)
X_test=pd.get_dummies(X_test)

# True == 1, False == 0
X_train
X_train.shape,y_train.shape
X_test.shape
# 모델 import
from sklearn.neighbors import KNeighborsClassifier
# 모델 객체 생성(KNN)
knn_model = KNeighborsClassifier(n_neighbors=10)
# 4. 학습 및 평가
# 모델 학습

knn_model.fit(X_train.values,y_train.values)
knn_model.predict([[0,0,0,0,0],[0,0,0,0,0]])
# 예측값 확인
pre=knn_model.predict(X_test)
pre
from sklearn import metrics
from sklearn.model_selection import cross_val_score
rs=cross_val_score(knn_model,X_train,y_train,cv=3)
print(rs)
print(rs.mean())
best_model=knn_model










