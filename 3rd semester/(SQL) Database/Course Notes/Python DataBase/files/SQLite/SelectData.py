import sqlite3
 # Connect to a database (or create it if it doesn't exist)
with sqlite3.connect('example.db') as conn: 
# Perform database operations here
    conn.autocommit = True 
    cursor = conn.cursor() 
    cursor.execute('''SELECT * from EMPLOYEE''') 
    result = cursor.fetchone()
    print(result)
    result = cursor.fetchone()
    print(result)
    result = cursor.fetchmany(101)
    print(result)
    result = cursor.fetchall()
    print(result)
    cursor.execute('''SELECT * from EMPLOYEE WHERE GENDER = 'M' ''') 
    result = cursor.fetchall()
    print(result)

#Commit your changes in the database 
conn.commit() 
#Closing the connection 
conn.close() 

