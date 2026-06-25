import pandas as pd
import sqlite3
 # Connect to a database (or create it if it doesn't exist)
with sqlite3.connect('example.db') as conn: 
# Perform database operations here
    conn.autocommit = True 
    cursor = conn.cursor() 
    df = pd.read_sql_query("SELECT * FROM EMPLOYEE", conn)
    # Or, if you want to read an entire table

# Close the connection
conn.close()

# Display the first few rows of the DataFrame
print(df.head())
