import pandas as pd
import sqlite3
 # Connect to a database (or create it if it doesn't exist)
with sqlite3.connect('titanic.db') as conn: 
# Perform database operations here
    conn.autocommit = True 
    cursor = conn.cursor() 
    df = pd.read_sql_query("SELECT * FROM titanic", conn)
    # Or, if you want to read an entire table
# Close the connection
conn.close()

# Filter rows based on a condition
minors = df[df['Age'] < 18]
print("minors")
for index, row in minors.iterrows():
    print(f"{row['Name']}, Age {row['Age']}")

 # Filter rows based on multiple conditions
poor_girls = df[(df['Age'] < 18) & (df['Sex'] == 'female') & (df['Fare'] < 10)]
print("poor girls")
for index, row in poor_girls.iterrows():
    print(f"{row['Name']} {row['Age']} year - Fare: {row['Fare']}")
 
