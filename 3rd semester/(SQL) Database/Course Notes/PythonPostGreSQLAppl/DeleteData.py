import psycopg
 
#Establishing the connection 
conn = psycopg.connect(dbname='mydb', user='postgres', 
password='postgres', host='localhost', port= '5432') 
conn.autocommit = True 

#Creating a cursor object using the cursor() method 
cursor = conn.cursor() 
 
#Retrieving contents of the table 
print("Contents of the table: ") 
cursor.execute('''SELECT * from EMPLOYEE''') 
print(cursor.fetchall()) 
 
#Deleting records 
cursor.execute('''DELETE FROM EMPLOYEE WHERE AGE > 90''') 
    
#Retrieving data after delete 
print("Contents of the table after delete operation ") 
cursor.execute("SELECT * from EMPLOYEE") 
print(cursor.fetchall())

#Commit your changes in the database 
conn.commit() 
#Closing the connection 
conn.close() 
