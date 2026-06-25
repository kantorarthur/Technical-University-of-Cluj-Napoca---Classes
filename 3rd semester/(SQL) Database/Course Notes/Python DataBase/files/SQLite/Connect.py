import sqlite3
 # Connect to a database (or create it if it doesn't exist)
conn = sqlite3.connect('example.db')
# Create a cursor object to execute SQL commands
cursor = conn.cursor()
# Don't forget to close the connection when you're done
conn.close()
