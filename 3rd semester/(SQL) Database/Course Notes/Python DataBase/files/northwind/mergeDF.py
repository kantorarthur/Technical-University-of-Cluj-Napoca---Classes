import pandas as pd
import sqlite3
 # Connect to a database (or create it if it doesn't exist)
with sqlite3.connect('northwind.db') as conn: 
# Perform database operations here
    conn.autocommit = True 
    cursor = conn.cursor() 
    products = pd.read_sql_query("SELECT * FROM products", conn)
    categories = pd.read_sql_query("SELECT * FROM categories", conn)
    merged_df = pd.merge(products, categories, on='category_id')
# Close the connection
conn.close()

# Display the first few rows of the DataFrame
for index, row in merged_df.sort_values(by=['category_name', 'product_name']).iterrows():
    print(f"{row['product_name']} of category: {row['category_name']}")
