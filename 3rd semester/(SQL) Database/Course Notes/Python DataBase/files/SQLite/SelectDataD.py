import sqlite3
 # Connect to a database (or create it if it doesn't exist)
with sqlite3.connect('example.db') as conn: 
# Perform database operations here
    conn.autocommit = True 
    conn.row_factory = sqlite3.Row
    cursor = conn.cursor() 
    cursor.execute('''SELECT * from EMPLOYEE''') 
    result = cursor.fetchall()
    for row in result:
        print(f"{row['FIRST_NAME']} {row['LAST_NAME']} is {row['AGE']} years old")

#Commit your changes in the database 
conn.commit() 
#Closing the connection 
conn.close() 

