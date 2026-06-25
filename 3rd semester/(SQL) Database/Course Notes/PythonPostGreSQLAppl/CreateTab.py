import psycopg
 
#Establishing the connection 
conn = psycopg.connect(dbname="mydb", user='postgres', 
password='postgres', host='localhost', port= '5432') 
conn.autocommit = True 

#Creating a cursor object using the cursor() method 
cursor = conn.cursor() 
 
#Doping EMPLOYEE table if already exists. 
cursor.execute("DROP TABLE IF EXISTS EMPLOYEE") 
#Creating table as per requirement 
sql ='''CREATE TABLE EMPLOYEE( 
        ID INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
        FIRST_NAME  VARCHAR(50) NOT NULL, 
        LAST_NAME  VARCHAR(50) NOT NULL, 
        AGE INT, 
        GENDER CHAR(1), 
        INCOME FLOAT,
        UNIQUE ( FIRST_NAME, LAST_NAME ))''' 
cursor.execute(sql) 
print("Table created successfully........") 

#Closing the connection 
conn.close()
