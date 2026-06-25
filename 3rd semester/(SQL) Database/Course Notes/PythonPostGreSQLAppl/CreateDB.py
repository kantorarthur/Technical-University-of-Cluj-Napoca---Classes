import psycopg
 
#establishing the connection 
conn = psycopg.connect(dbname="postgres", user='postgres', 
password='postgres', host='localhost', port= '5432') 
conn.autocommit = True 
 
#Creating a cursor object using the cursor() method 
cursor = conn.cursor() 
 
#Preparing query to create a database 
sql = '''CREATE database mydb'''; 
 
#Creating a database 
cursor.execute(sql) 
print("Database created successfully........") 
 
#Closing the connection 
conn.close() 
