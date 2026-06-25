import psycopg
 
#Establishing the connection 
conn = psycopg.connect(dbname='mydb', user='postgres', 
password='postgres', host='localhost', port= '5432') 
conn.autocommit = True 

#Creating a cursor object using the cursor() method 
cursor = conn.cursor() 
 
# Preparing SQL queries to INSERT a record into the database. 
cursor.execute('''INSERT INTO EMPLOYEE(FIRST_NAME, LAST_NAME, AGE, GENDER, INCOME) 
               VALUES ('Daniela', 'CRUDU', 27, 'F', 9000)''') 
cursor.execute('''INSERT INTO EMPLOYEE(FIRST_NAME, LAST_NAME, AGE, GENDER, INCOME) 
               VALUES ('Nina', 'ILIESCU', 99, 'F', 5000)''') 
cursor.execute('''INSERT INTO EMPLOYEE(FIRST_NAME, LAST_NAME, AGE, GENDER, INCOME) 
               VALUES ('Emil', 'CONSTANTINESCU', 88, 'M', 6000)''') 
cursor.execute('''INSERT INTO EMPLOYEE(FIRST_NAME, LAST_NAME, AGE, GENDER, INCOME) 
               VALUES ('Traian', 'BASESCU', 77, 'M', 7000)''') 
cursor.execute('''INSERT INTO EMPLOYEE(FIRST_NAME, LAST_NAME, AGE, GENDER, INCOME) 
               VALUES ('Klaus Werner', 'JOHANNIS', 66, 'M', 8000)''') 
cursor.execute('''INSERT INTO EMPLOYEE(FIRST_NAME, LAST_NAME, AGE, GENDER, INCOME) 
               VALUES ('Nicusor', 'DAN', 55, 'M', 9000)''') 
   
# Commit your changes in the database 
conn.commit() 
 
print("Records inserted........") 
