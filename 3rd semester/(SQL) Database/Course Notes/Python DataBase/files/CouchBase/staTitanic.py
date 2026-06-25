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

survived0 = df[df['Survived'] == 0]
survived1 = df[df['Survived'] == 1]
print(f"There were {df['PassengerId'].count()} on Titanic \
 and only {survived1['PassengerId'].count()} survived.")

result = df.groupby(['Survived', 'Sex']).agg({
'Age': ['count', 'min', 'mean', 'median', 'max'],
'Fare': ['count','mean', 'median']
})
print(result)

px = 100 * ((result['Fare']['count'].loc[1, 'female'] + result['Fare']['count'].loc[1, 'male']) / \
(result['Fare']['count'].loc[1, 'female'] + result['Fare']['count'].loc[0, 'female'] \
 + result['Fare']['count'].loc[1, 'male'] + result['Fare']['count'].loc[0, 'male']))

pxf = 100 * ((result['Fare']['count'].loc[1, 'female']) / \
(result['Fare']['count'].loc[1, 'female'] + result['Fare']['count'].loc[0, 'female']))

pxm = 100 * ((result['Fare']['count'].loc[1, 'male']) / \
(result['Fare']['count'].loc[1, 'male'] + result['Fare']['count'].loc[0, 'male']))
print(f"{round(px,  2)}% survived")
print(f"{round(pxf, 2)}% female survived")
print(f"{round(pxm, 2)}% male survived")

