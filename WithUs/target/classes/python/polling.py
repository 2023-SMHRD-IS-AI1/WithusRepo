pip install pymysql
import time
import pymysql
import pickle
file_path = "./matching1.pkl"

with open (file_path, 'rb') as file:
    loaded_object = pickle.load(file)
    
print(loaded_object)
def matching(data_row):
    model_output = 
    return model_output
while True:
    # 데이터베이스 연결
    connection = pymysql.connect(host='project-db-campus.smhrd.com', user='campus_23IS_LI1_hack_4', password='smhrd4', db='campus_23IS_LI1_hack_4', port=3307)
    
    try:
        with connection.cursor() as cursor:
            print('들어왔음')
            sql = "SELECT * FROM surveys where processed=0"
            
            cursor.execute(sql)
            
            result = cursor.fetchall()
            
            for row in result:
                # 머신러닝 모델 실행
                print('실행전')
                model_output = matching(row)
                print('실행후')
                # 결과를 데이터베이스에 업데이트
                update_sql = "UPDATE surveys SET result_label = %s, processed = 1 WHERE id = %s"
                cursor.execute(update_sql, (model_output, row['mb_id']))
                print('성공')
                connection.commit()
    except Exception as e:
        print(f"An error occurred: {e}")
                
    finally:
        connection.close()

    # 일정 시간 대기 후 반복
    time.sleep(60)

import time
import pymysql
import pickle
import numpy as np
# 모델 불러오기
file_path = "./matching3.pkl"
with open(file_path, 'rb') as file:
    model = pickle.load(file)

def matching(data_row):
    # 여기에서 모델을 사용하여 예측을 수행합니다.
    # 예를 들어, model.predict(data_row)를 호출할 수 있습니다.
    # data_row 형식이 모델 입력 형식과 일치해야 합니다.
    model_output = model.predict(data_row)  # 예측 실행
    return model_output

while True:
    # 데이터베이스 연결
    connection = pymysql.connect(host='project-db-campus.smhrd.com', user='campus_23IS_LI1_hack_4', password='smhrd4', db='campus_23IS_LI1_hack_4', port=3307)
    
    try:
        with connection.cursor() as cursor:
            print('들어왔음')
            sql = "SELECT q1,q2,q3,q4,q5 FROM surveys WHERE processed = 0"
            cursor.execute(sql)
            results = cursor.fetchall()
            
            for row in results:
                print('실행전')
                model_output = matching([row])  # 각 행에 대해 모델 실행
                print('실행후')
                # 결과를 데이터베이스에 업데이트
                update_sql = "UPDATE surveys SET result_label = %d, processed = 1 WHERE id = %s"
                cursor.execute(update_sql, (model_output, row['id']))
                print('성공')
                connection.commit()
    except Exception as e:
        print(f"An error occurred: {e}")
    finally:
        connection.close()

    # 일정 시간 대기 후 반복
    time.sleep(60)

import time
import pymysql
import pickle
import numpy as np

# 모델 불러오기
file_path = "./matching3.pkl"
with open(file_path, 'rb') as file:
    model = pickle.load(file)

def matching(data_row):
    # 여기에서 모델을 사용하여 예측을 수행합니다.
    model_output = model.predict(np.array([data_row]))  # 예측 실행
    return model_output

while True:
    # 데이터베이스 연결
    connection = pymysql.connect(host='project-db-campus.smhrd.com', user='campus_23IS_LI1_hack_4', password='smhrd4', db='campus_23IS_LI1_hack_4', port=3307)
    
    try:
        with connection.cursor() as cursor:
            print('들어왔음')  
            sql = "SELECT mb_id, q1, q2, q3, q4, q5 FROM surveys WHERE processed = 0"
            cursor.execute(sql)
            results = cursor.fetchall()
            
            for row in results:
                print('실행전')
                
                model_output = matching(row[1:])  # 각 행에 대해 모델 실행, 첫 번째 열(id)는 제외
                print('실행후')
                # 결과를 데이터베이스에 업데이트
                update_sql = "UPDATE surveys SET result_label = %s, processed = 1 WHERE mb_id = %s"
                cursor.execute(update_sql, (model_output[0], row[0]))  # 첫 번째 모델 출력과 id 사용
                print('성공')
                connection.commit()
    except Exception as e:
        print(f"An error occurred: {e}")
    finally:
        connection.close()

    # 일정 시간 대기 후 반복
    time.sleep(5)


