import pandas as pd
from sqlalchemy import create_engine

 # Connect to a database (or create it if it doesn't exist)
with create_engine("couchbase:///?User=Administrator&;Password=Administrator&Server=http://localhost:8091") as conn: 
   df = pd.read_sql_query("SELECT * FROM titanic", conn)
    # Or, if you want to read an entire table
# Close the connection
conn.close()

# Display the first few rows of the DataFrame
for index, row in df.iterrows():
    print(f"{row['Name']}, Age {row['Age']}")
