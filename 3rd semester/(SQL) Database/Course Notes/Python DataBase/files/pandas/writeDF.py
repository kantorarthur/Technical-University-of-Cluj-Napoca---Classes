import pandas as pd
import sqlite3
 # Create a sample DataFrame
data = {
'name': ['Alexandru', 'Bogdan', 'Calin'],
'age': [25, 30, 55],
'city': ['New York', 'San Francisco', 'Los Angeles']
}
df = pd.DataFrame(data)
print(df)
# Connect to the SQLite database
with sqlite3.connect('example.db') as conn: 
# Perform database operations here
    conn.autocommit = True 
    cursor = conn.cursor() 
    # Write the DataFrame to a new table
    df.to_sql('people', conn, if_exists='replace', index=False)

print("Records inserted........") 
conn.commit()
# Close the connection
conn.close()
