import psycopg
 
#Establishing the connection 
conn = psycopg.connect(dbname='mydb', user='postgres', 
password='postgres', host='localhost', port= '5432') 
conn.autocommit = True 

#Creating a cursor object using the cursor() method 
cursor = conn.cursor() 
 
#Retrieving data 
cursor.execute('''SELECT * from EMPLOYEE''') 
 
#Fetching 1st row from the table 
result = cursor.fetchone(); 
print(result) 
 
#Fetching rows from the table 
result = cursor.fetchall(); 
print(result) 
 
#Commit your changes in the database 
conn.commit() 
 
#Closing the connection 
conn.close() 

