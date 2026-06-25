import psycopg
 
#Establishing the connection 
conn = psycopg.connect(dbname='mydb', user='postgres', 
password='postgres', host='localhost', port= '5432') 
conn.autocommit = True 

#Creating a cursor object using the cursor() method 
cursor = conn.cursor() 
 
#Fetching all the rows before the update 
print("Contents of the Employee table: ") 
sql = '''SELECT * from EMPLOYEE''' 
cursor.execute(sql) 
print(cursor.fetchall()) 
 
#Updating the records 
sql = "UPDATE EMPLOYEE SET AGE = AGE + 1 WHERE GENDER = 'M'" 
cursor.execute(sql) 
print("Table updated...... ") 
   
#Fetching all the rows after the update 
print("Contents of the Employee table after the update operation: ") 
sql = '''SELECT * from EMPLOYEE''' 
cursor.execute(sql) 
print(cursor.fetchall()) 

#Commit your changes in the database 
conn.commit() 
#Closing the connection 
conn.close() 
