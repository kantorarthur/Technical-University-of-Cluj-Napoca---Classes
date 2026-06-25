import pandas as pd
import sqlite3


df = pd.read_json('titanic.json')
print(df)
# Connect to the SQLite database
with sqlite3.connect('titanic.db') as conn: 
# Perform database operations here
    conn.autocommit = True 
    cursor = conn.cursor() 
    # Write the DataFrame to a new table
    df.to_sql('titanic', conn, if_exists='replace')

print("Records inserted........") 
conn.commit()
# Close the connection
conn.close()

