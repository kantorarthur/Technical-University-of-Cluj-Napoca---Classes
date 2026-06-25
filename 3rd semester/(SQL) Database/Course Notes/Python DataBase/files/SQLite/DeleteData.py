import sqlite3
 # Connect to a database (or create it if it doesn't exist)
# input
print(f"Enter Age limit:")
inputAge = input()
print(f"Enter Income limit:")
inputIncome = input()

with sqlite3.connect('example.db') as conn: 
# Perform database operations here
    conn.autocommit = True 
    cursor = conn.cursor() 
 
#Fetching all the rows before the update 
    print("Contents of the Employee table - Before") 
    sql = '''SELECT * from EMPLOYEE''' 
    cursor.execute(sql) 
    print(cursor.fetchall()) 
 
#Deleting the records 
    sql = '''DELETE FROM EMPLOYEE WHERE AGE > ? AND INCOME < ?'''
    cursor.execute(sql,(inputAge, inputIncome,)) 
    print("Table updated...... ") 
   
#Fetching all the rows after the update 
    print("Contents of the Employee table - After the update operation: ") 
    sql = '''SELECT * from EMPLOYEE''' 
    cursor.execute(sql) 
    print(cursor.fetchall()) 

#Commit your changes in the database 
conn.commit() 
#Closing the connection 
conn.close() 

