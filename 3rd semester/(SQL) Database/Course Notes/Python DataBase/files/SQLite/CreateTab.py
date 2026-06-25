import sqlite3
 # Connect to a database (or create it if it doesn't exist)
with sqlite3.connect('example.db') as conn: 
        conn.autocommit = True 
        cursor = conn.cursor() # Perform database operations here
        #Creating table as per requirement 
        sql = '''CREATE TABLE EMPLOYEE( 
        ID INTEGER PRIMARY KEY ,
        FIRST_NAME  TEXT NOT NULL, 
        LAST_NAME  TEXT NOT NULL, 
        AGE INTEGER, 
        GENDER CHAR(1), 
        INCOME REAL,
        UNIQUE ( FIRST_NAME, LAST_NAME ))''' 
        cursor.execute(sql) 
print("Table created successfully........") 
