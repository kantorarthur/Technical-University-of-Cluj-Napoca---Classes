import sqlite3
 # Connect to a database (or create it if it doesn't exist)
with sqlite3.connect('example.db') as conn: 
# Perform database operations here
    conn.autocommit = True 
    cursor = conn.cursor() 
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
print("Records inserted........") 
#Commit your changes in the database 
conn.commit() 
#Closing the connection 
conn.close() 

