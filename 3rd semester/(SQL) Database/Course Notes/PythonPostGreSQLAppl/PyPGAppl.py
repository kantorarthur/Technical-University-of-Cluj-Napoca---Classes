import psycopg
# Connection details (replace with your own)
DATABASE_URL = "postgresql://postgres:postgres@localhost:5432/northwind"

conn = psycopg.connect(DATABASE_URL) 
cur = conn.cursor()
cur.execute("SELECT * FROM employees")
items = cur.fetchall() # Fetch all results as a list of tuples
for row in items:
  print(f"{row[2]} {row[1]}")
