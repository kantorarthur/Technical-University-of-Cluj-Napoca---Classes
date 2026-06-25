import psycopg
 
#Establishing the connection 
conn = psycopg.connect(dbname='northwind', user='postgres', 
password='postgres', host='localhost', port= '5432') 
conn.autocommit = True 

#Creating a cursor object using the cursor() method 
cursor = conn.cursor() 

# input
print(f"Enter Page No.:")
inputPage = input()

#Retrieving contents of the table 
print(f"Contents of the table Customers page {inputPage}") 
cursor.execute('''SELECT * from CUSTOMERS ORDER BY COMPANY_NAME 
    LIMIT 5 OFFSET (%(p)s - 1) * 5''', {'p': inputPage}) 
result = cursor.fetchall()
for row in result:
    print(f"{row[1]} has {row[2]} as contact person from {row[5]} {row[8]}")

#Commit your changes in the database 
conn.commit() 
#Closing the connection 
conn.close() 

